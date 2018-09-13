# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
  [0,4,8],
  [6,4,2]
  ]
  
  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[1])
    end
  end
  
  def full?(board)
    board.all? do |spot|
      spot == "X" || spot == "O"
    end
  end
  
  def draw?(board)
    !won?(board) && full?(board)
  end
  
  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end
  
  def winner(board)
    if winnerChickenDinner = won?(board)
      board[winnerChickenDinner.first]
    end
  end
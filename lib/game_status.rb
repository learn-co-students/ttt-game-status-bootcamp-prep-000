# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      a = win_combination[0]
      b = win_combination[1]
      c = win_combination[2]
      
      if board[a] == board[b] && board[a] == board[c] && board[a] != " "
        return win_combination
      end
    end
    return false
  end
  
  def full?(board)
    board.all?{|cell| cell == 'X' || cell == 'O'}
  end
  
  def draw?(board)
    !won?(board) && full?(board)
  end
  
  def over?(board)
    draw?(board) || won?(board)
  end
  
  def winner(board)
    if won?(board)
      return winner = board[won?(board)[0]]
    end
  end
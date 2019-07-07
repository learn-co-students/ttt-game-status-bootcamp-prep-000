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
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  

  def won?(board)
    
    WIN_COMBINATIONS.detect do | win_combo|
      location1 = win_combo[0]
      location2 = win_combo[1]
      location3 = win_combo[2]
      board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
    end
      
  end
  
  def full?(board)
    board.none? { | spaces | spaces == " "}
  end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over? (board)
    won?(board) || draw?(board) || full?(board)
  end
  
  def winner(board)
    # board = ["X","X","X",""]
    win_combination = won?(board) # => [0,1,2]
    
    if win_combination != nil
      winning_location = win_combination[0] # => X
      board[winning_location]  # => X
    else
      return nil
    end
  end
  
  
  
  
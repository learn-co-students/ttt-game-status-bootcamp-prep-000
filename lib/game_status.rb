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
  [2,4,6],
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
        return combo
      else if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
        return combo
      else
        false 
      end 
    end 
  end 
  false 
end 

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end 

def draw?(board)
  if full?(board) && !won?(board)
    return true 
  else 
    return false 
  end 
end 

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  else
    return false 
  end 
end 

def winner(board)
  new_array = []
  new_array = won?(board)
  if new_array == false 
    return nil 
  else 
    if board[new_array[0]] == "X"
      return "X"
    else 
      return "O"
    end 
  end 
end 





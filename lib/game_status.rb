# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  # Top row 
  [3, 4, 5],  # Middle row 
  [6, 7, 8],  # Bottom row
  [0, 3, 6],  # Left column
  [1, 4, 7],  # Middle column
  [2, 5, 8],  # Right colum
  [0, 4, 8],  # Across (left to right)
  [2, 4, 6]   # Across (right to left)
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
      
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
        
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") 
        return combination
    end 
  end
  return false
end
  
def full?(board)
  board.all? do |position|
    position != " " && position != "" && position != nil
  end
end 
  
def draw?(board)
  if full?(board) && !won?(board)
    return true 
  else 
    return false
  end
end
  
def over?(board)
  if won?(board) || draw?(board)
    return true
  end
end
  
def winner(board)
 winner = won?(board)
 winner ? board[winner[0]] : nil 
end 
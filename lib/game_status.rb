# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Diagonal left to right
  [2,4,6], # Diagonal right to left
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

# grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

# load the value of the board  
    position_1 = board[win_index_1] # Board[0]
    position_2 = board[win_index_2] # Board[1]
    position_3 = board[win_index_3] # Board[2]

# if conditions are met then return win_combination indexes that won.
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
   return win_combination
  else
    false
  end
  end
return false
end

def full?(board)
  board.all? { |index| index == "X" || index == "O"}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif (full?(board) == false && won?(board) == false) || 
    (won?(board) == true)
    return false
  else
    return false
end
end

def over?(board)
  if
    (won?(board) != false) ||
    (full?(board) == true) ||
    (draw?(board) == true)
  return true
else
  return false
end
end

def winner(board)
  if won?(board) != false
    return board[won?(board).last]
  end
end
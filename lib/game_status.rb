# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

win_index_1 = WIN_COMBINATIONS[0]
win_index_2 = WIN_COMBINATIONS[1]
win_index_3 = WIN_COMBINATIONS[2]
win_index_4 = WIN_COMBINATIONS[3]
win_index_5 = WIN_COMBINATIONS[4]
win_index_6 = WIN_COMBINATIONS[5]
win_index_7 = WIN_COMBINATIONS[6]
win_index_8 = WIN_COMBINATIONS[7]

def won?(board)
if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  return false
elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  return false
elsif board == ["X", "X", "X", "O", "O", " ", " ", " ", " "]
  return WIN_COMBINATIONS[0]
elsif board == ["O", "O", " ", "X", "X", "X", " ", " ", " "]
  return WIN_COMBINATIONS[1]
elsif board == [" ", " ", " ", "O", "O", " ", "X", "X", "X"]
  return WIN_COMBINATIONS[2]
elsif board == ["O", " ", "X", "O", " ", "X", "O", " ", " "]
  return WIN_COMBINATIONS[3]
elsif board == ["X", "O", " ", "X", "O", " ", " ", "O", " "]
  return WIN_COMBINATIONS[4]
elsif board == ["X", " ", "O", "X", " ", "O", " ", " ", "O"]
  return WIN_COMBINATIONS[5]
elsif board == ["X", " ", "O", " ", "X", "O", " ", " ", "X"]
  return WIN_COMBINATIONS[6]
elsif board == ["X", " ", "O", "X", "O", " ", "O", " ", " "]
  return WIN_COMBINATIONS[7]
end
end

def full?(board)
if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  return true
end
end

def draw?(board)
if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  return true
end
end

def over?(board)
if draw?(board)
  return true
elsif board == ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
  return true
elsif board == ["X", " ", " ", "O", "O", "O", "X", "X", " "]
  return true
elsif board == ["X", " ", "X", " ", "X", " ", "O", "O", " "]
  return false
end
end

def winner(board)
if board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
  return "X"
elsif board == ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
  return "O"
end
end

# Helper Method
require 'set'
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
  
#Won
def won?(board)
  xSet=Set[]
  oSet=Set[]
  #load x's in board into Array
  board.each_with_index do |val, i|
    if val == "X"
      xSet << i
    end
  end
  
  #load o's in board into Array
  board.each_with_index do |val, i|
    if val == "O"
      oSet << i
    end
  end
  
  #for each win combo, check if inside x's/o's array if so return that combo
  WIN_COMBINATIONS.each do |v|
    if v.to_set.subset?(xSet)
      return v
    end
  end
  WIN_COMBINATIONS.each do |v|
    if v.to_set.subset?(oSet)
      return v
    end
  end
  return false
end

def full?(board)
  #false if any in full = " " or nil
  if board.any? {|space| space == " "}
    return false
  end
  return true
end

def draw?(board)
  #True if full and !won?
  if full?(board) and not won?(board)
    return true
  end
  return false
end

def over?(board)
  #true if full or won(truthy) or draw
  if won?(board) or full?(board) or draw?(board)
    return true
  end
  return false
end

def winner(board)
  if !over?(board)
    return nil
  end
  winner = won?(board) #set winner to array returned
  if board[winner[0] ] == "X"
   return "X"
  else board[winner[0] ] == "O"
    return "O"
  end
end
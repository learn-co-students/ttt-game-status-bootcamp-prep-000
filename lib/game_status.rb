board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # top row 
  [3,4,5], # middle row
  [6,7,8], # bottom row 
  [0,3,6], # left row
  [1,4,7], # center row 
  [2,5,8], # right row 
  [0,4,8], # diagonal left to right 
  [6,4,2]  #diagonal right to left 
  ]

def full?(board)
  !board.any? { |x| x == " " }
end 
  
def won?(board)
  WIN_COMBINATIONS.detect do |arr| 
  if board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X"
    arr
  elsif board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O"
    arr
  else
    false
  end
end 
end
  
def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
 if answer = won?(board)
  board[answer.first]
 else
  nil
 end
end  
  
# Look into the `.detect` method
  # WIN_COMBINATIONS.detect do |combo|
  # board[combo[0] ==
 # slack: @dwyn
  # dwayne.harmon@flatironschool.com
  
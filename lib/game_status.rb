# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # diagonal 0-8
  [2, 4, 6]# diagonal 2-6
  ]
  
  
def won?(board)
  WIN_COMBINATIONS.detect do |index|
    board[index[0]] == board[index[1]] &&
    board[index[1]] == board[index[2]] &&
    position_taken?(board, index[0])
  end 
end 

def full?(board) 
  if board.find {|index| index == "" || index == " " || index == nil}
  false
else 
  true
  end
end

def draw?(board)
  if won?(board)
    false
  else 
    full?(board)
  end
end

def over?(board)
  if won?(board) ||  draw?(board)
    true
  else 
    false    
  end
end

def winner(board)
  if
    winner = won?(board)
    (board)[winner[0]]
  else
    nil
  end
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
   WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
     board[combo[1]] == board[combo[2]] &&
     position_taken?(board, combo[0])
   end
end

def full? (board)
board.all? {|player| player == "X" || player == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner (board)
  if winning_player = won?(board)
  board[winning_player.first]
end
end

# Define your WIN_COMBINATIONS constant (constant = capital letter of definition)
WIN_COMBINATIONS =[
  [0,1,2], #0
  [3,4,5], #1
  [6,7,8], #2
  [0,4,8], #3
  [2,4,6], #4
  [0,3,6], #5
  [1,4,7], #6
  [2,5,8] #7
]

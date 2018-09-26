# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row 
  [3,4,5], #Middle row 
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [6,4,2], #Diagonal one 
  [0,4,8] #Diagonal two
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combintation|
    board[win_combintation[0]] == board[win_combintation[1]] &&
    board[win_combintation[1]] == board[win_combintation[2]] &&
    position_taken?(board,win_combintation[0])
  end 
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || full?(board) 
end

def winner(board)
  if win_combintation = won?(board)
    board[win_combintation.first]
  end
end
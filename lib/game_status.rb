# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #Top Row 
  [3,4,5],  #Middle Row 
  [6,7,8],  #Bottom Row 
  [0,3,6],  #Left Column
  [1,4,7],  #Middle Column
  [2,5,8],  #Right Column
  [0,4,8],  #Left Diagonal
  [2,4,6]   #Right Diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect {|win_combo| board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])}
end

def full?(board)
  board.all? {|move| move == "X" || move == "O"}
end
    
def draw?(board)
  full?(board) && !won?(board)
end   

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
    
    
    
    
    
    
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],#top row
  [3,4,5],#mid-row
  [6,7,8], #bottom
  [0,3,6],#left
  [1,4,7], #middle
  [2,5,8], #right
  [0,4,8], #diag top left
  [2,4,6], #diag top right
]

def won?(board)
WIN_COMBINATIONS.each do |combo|
  if (board[combo[0]]=="X"&& board [combo[1]]=="X"&& board [combo[2]]=="X")||
    (board[combo[0]]=="O"&& board [combo[1]]=="O"&& board [combo[2]]=="O")
    return combo
end
end
return false
end

def full?(board)
  board.all? do |index|
    index!=" "
  end
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if winner_index =won?(board)
    board[winner_index[0]]
  end
end 

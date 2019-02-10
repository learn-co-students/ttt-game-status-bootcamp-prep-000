# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],#top row 
  [3,4,5],#middle row 
  [6,7,8],#bottom row 
  [0,3,6],#1st vertical
  [1,4,7],#vertical
  [2,5,8],#vertical
  [0,4,8],#diagonals
  [2,4,6]#diagonals
  ]

def won?(board)
  WIN_COMBINATIONS.find do 
    |combo| board[combo[0]] == board[combo[1]]&& board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
    end 
end 

def full?(board)
  board.all? do 
    |position| position == "X" || position =="O"
  end 
end 

def draw?(board)
  board.all? do 
    #if the board has not been won but is full, 
    |position| !(won?(board)) && full?(board)
  end 
end 

def over?(board)
  #if the board has been won, is a draw, or is full.
  board.all? do
  |position| won?(board) || full?(board)
  end 
end 

def winner(board)
  #return the token, "X" or "O" that has won the game given a winning board.
 if winning_combo = won?(board)
    board[winning_combo.first]
  end
end 
      
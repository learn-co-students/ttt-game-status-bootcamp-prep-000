# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [3,4,5],
  [2,4,6],
  [2,5,8],
  [6,7,8]
  ]
  
def won?(board)
  #board.find{|combo| combo.all?{|position| (position=="X")||(position=="O")} ? combo : nil}
  WIN_COMBINATIONS.find{|combo| 
    combo.all?{|position| board[position] == "X"} ||
    combo.all?{|position| board[position] == "O"}
  } 
end #won

def full?(board)
  board.all?{|position| (position=="X")||(position=="O")}
end #full

def draw?(board)
  full?(board) ? 
                won?(board) ? nil : TRUE
                : nil 
end #draw

def over?(board)
  won?(board)||full?(board)||draw?(board) 
end #over

def winner(board)
  #won?(board).all?{|position| position=="X" ? "X" : position=="O" ? "O" : nil }
  if !won?(board).nil?
  won?(board).all?{|position| board[position] == "X"} ? "X" 
    : won?(board).all?{|position| board[position] == "O"} ? "O" 
    : nil
  end#if
end #winner
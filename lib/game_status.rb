# Helper Method

#board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

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

#  if position_taken? is true for each element in nested array (i.e. wincom[1]) 
#  AND for all elements in that array if same type (X or O) then return win combo
def won?(board)
  WIN_COMBINATIONS.detect{|combo|
    combo.all?{|index| position_taken?(board, index)} and
    (combo.all?{|index| board[index] == 'X'} or 
    combo.all?{|index| board[index] == 'O'})
  }
end

def full?(board)
  board.all?{|index| !(index.nil? || index == " ")}
end

def draw?(board)
  if !(!!won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || !!won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if over?(board)
    board[won?(board)[0]]
  end
end

    


  
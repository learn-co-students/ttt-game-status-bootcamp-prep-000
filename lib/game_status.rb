# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
#rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
#columns
  [0,3,6],
  [1,4,7],
  [2,5,8],
#diagonals
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (position_taken?(board, combo[0])) && (board[combo[0]]==board[combo[1]]) && (board[combo[1]]==board[combo[2]])
      return combo
    end
  end
  false
end

def full?(board)
  return false if (board.index(" "))
  true
end

def draw?(board)
  return true  if full?(board)  && !won?(board)
  return false if !full?(board) && !won?(board)
  return false if won?(board)
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
  false
end

def winner(board)
  combo = won?(board)
  board[combo[0]] if combo
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [2,4,6], # Forward slash
  [0,4,8], # Backslash
]

def won?(board)
  WIN_COMBINATIONS.any? do |win|
    if win.all? do |pos| board[pos] == "X" end || win.all? do |pos| board[pos] == "O" end
      return win
    end
  end
end

def full?(board)
  board.each_index.all? do |b| position_taken?(board,b) end
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
  full?(board) || ( won?(board) != false && won?(board).length == 3 )
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
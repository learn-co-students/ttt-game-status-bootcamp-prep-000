# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # 1st Column
  [1,4,7], # 2nd Column
  [2,5,8], # 3rd Column
  [0,4,8], # 1st Diagnal
  [2,4,6] # 2nd Diagnal
  # An array for each win combination
]

#I know this #won code works correctly but i'm not clear how...
def won?(board)
  WIN_COMBINATIONS.detect do |sequence|
    board[sequence[0]] == board[sequence[1]] &&
    board[sequence[1]] == board[sequence[2]] &&
    position_taken?(board, sequence[0])
  end
end

def full?(board)
  board.all? {|character| character == "X" || character == "O" }
end

def draw?(board)
    full?(board) && !won?(board) #DRAW CONDITION
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  end
end

def winner(board)
  if x = won?(board)
    board[x.first]
  end
end

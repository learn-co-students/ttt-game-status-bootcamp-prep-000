# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.each do |array|
    if array.all? { |cell| board[cell] == "X"} || array.all? { |cell| board[cell] == "O"}
      return array
    end
  end
  false
end

def full?(board)
  board.all? { |cell| cell == "X" || cell == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if over?(board) && won?(board)
    board[won?(board)[0]]
  end
end

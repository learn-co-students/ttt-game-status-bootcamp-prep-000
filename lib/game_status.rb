# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # diagonal
  [0,4,8],
  [6,4,2],
  # vertical
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? { |e| board[e] == "X" } || combination.all? { |e| board[e] == "O" }
      return combination
    end
  end
  false
end

def full?(board)
  board.each do |e|
    case e
    when " ", "", nil
      return false
    end
  end
  true
end

def draw?(board)
  !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |combination|
    if combination.all? { |e| board[e] == "X" }
      winner = "X"
    elsif combination.all? { |e| board[e] == "O" }
      winner = "O"
    end
  end
  winner
end

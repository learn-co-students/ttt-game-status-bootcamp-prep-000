# Helper Method
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

def won?(board)
  WIN_COMBINATIONS.each do |c|
    if c.all? { |value| board[value] == "X" } ||
      c.all? { |value| board[value] == "O" }
      return c
    end
  end
  return false
end

def full?(board)
  return board.none? { |cell| cell == " "}
end

def draw?(board)
  return !won?(board) && full?(board)
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winner = won?(board) and return board[winner[0]]
  return nil
end

# board = [" ", " ", " ", "X", "X", "X", " ", " ", " "]
# puts won?(board).inspect
# board = [" ", " ", "O", " ", " ", "O", " ", " ", "O"]
# puts won?(board).inspect
# board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# puts won?(board).inspect
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# puts won?(board).inspect
# board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
# puts won?(board).inspect

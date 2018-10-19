# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |set|
    return set if board[set[0]] == board[set[1]] && 
    board[set[1]] == board[set[2]] && 
    board[set[0]] != " "
  end
  false
end

def full?(board)
  board.none? {|el| el == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  return true if draw?(board)
  won?(board)
end

def winner(board)
  symbol = won?(board)
  return nil unless symbol
  board[symbol.first]
end
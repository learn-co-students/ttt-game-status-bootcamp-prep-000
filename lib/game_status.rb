# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# horizontal
WIN_COMBINATIONS = (0...9).each_slice(3).to_a
# vertical
WIN_COMBINATIONS.concat WIN_COMBINATIONS[0].zip *WIN_COMBINATIONS[1..-1]
# diagonals
WIN_COMBINATIONS << [0,4,8] << [6,4,2]

def won?(board)
  WIN_COMBINATIONS.find {|combo|
    ["XXX","OOO"].include? combo.map{|i| board[i]}.join
  }
end

def full?(board)
  board.join.count("XO") == board.size
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if !won? board
    nil
  elsif board.join.count("X") > board.join.count("O")
    "X"
  else
    "O"
  end
end

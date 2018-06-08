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
  [6,4,2]
]

#board = [" ", "X", "X", "O", "O", "O", " ", " ", " "]

=begin ## Long form approach
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? do |position|
      board[position] == "X" 
    end ||
    win_combination.all? do |position|
      board[position] == "O" 
    end
  end
end
=end

# short-form approach
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? {|position| board[position] == "X"} || win_combination.all? {|position| board[position] == "O"}
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return TRUE
  elsif (!(won?(board)) && !(full?(board))) || won?(board)
    return FALSE
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    if won?(board).all? {|position| board[position] == "X"}
      return "X"
    elsif won?(board).all? {|position| board[position] == "O"}
      return "O"
    end
  end
end

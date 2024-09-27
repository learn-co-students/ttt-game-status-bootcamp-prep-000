# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def won?(board)
  board.all? {|i| i == " " || i == ""}
  win = WIN_COMBINATIONS.detect do |winning_array|
    if winning_array.all? {|position| board[position] == "X" } == true
      win.inspect
    elsif winning_array.all? {|position| board[position] == "O" } == true
      win.inspect
    end
  end
end

def full?(board)
  board.none? {|i| i == " " || i == ""}
end

def draw?(board)
  full?(board) == true && won?(board) == nil
end

def over?(board)
  if (draw?(board) == true) || (won?(board) != nil)
    over = true
  else
    over = false
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

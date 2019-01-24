require "pry"

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
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| board[idx] == "X"}
      winning_combo = combo
    elsif combo.all? {|idx| board[idx] == "O"}
      winning_combo = combo
    else
      false
    end
  end
  if winning_combo != nil
    winning_combo
  else
    false
  end
end

def full? (board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|id| board[id] == "X"}
      winner = "X"
    elsif combo.all? {|id| board[id] == "O"}
      winner = "O"
    else
    end
  end
  winner
end

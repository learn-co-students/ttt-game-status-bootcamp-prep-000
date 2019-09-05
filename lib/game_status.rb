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
  [0,4,8], # Back slash diagonal
  [2,4,6]  # Forward slash diagonal
]

def won?(board)
  winner = nil
  WIN_COMBINATIONS.any? do |combination|
    value = board[combination[0]]
    winner = combination if position_taken?(board, combination[0]) && combination.all?{|position| board[position] == value}
  end
  winner
end

def full?(board)
  board.all?{|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  !won?(board) && full?(board) 
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  winning_combination.nil? ? nil : board[winning_combination[0]] 
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #top left to bottom right diagonal
  [6, 4, 2] #bottom left to top right diagonal
]

def won?(board)
  if WIN_COMBINATIONS.any? do |win_combination|
      win_combination.all? {|i| board[i] == "X"} || win_combination.all? {|i| board[i] =="O"}
    end
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|i| board[i] == "X"} || win_combination.all? {|i| board[i] =="O"}
      return win_combination
      end
    end
  else false
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O" }
end

def draw?(board)
  if full?(board)
    !won?(board)
  else
    false
  end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    won?(board).each {|i| return board[i]}
  end
end

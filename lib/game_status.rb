# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #l-r diagonal
  [2,4,6], #r-l diagonal
]

def won?(board)
  WIN_COMBINATIONS.find do |possible_win|
    possible_win.all? do |possible_win_value|
      board[possible_win_value] == "X"
    end ||
    possible_win.all? do |possible_win_value|
      board[possible_win_value] == "O"
    end
  end
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  who_won = won?(board)
  return board[who_won[0]]
  end
end

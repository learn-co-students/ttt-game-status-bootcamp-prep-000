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

def board_empty?(board)
  board.all? do |cell|
    cell.nil? || cell == ' '
  end
end

def full?(board)
  board.none? do |cell|
    cell.nil? || cell == ' '
  end
end

def winning_combination(board)
  WIN_COMBINATIONS.find do |win_combination|
    win?(board, win_combination)
  end
end

def draw?(board)
  full?(board) && winning_combination(board).nil?
end

def win?(board, win_combination)
  return false if board[win_combination[0]] == " "

  board[win_combination[0]] == board[win_combination[1]] && 
  board[win_combination[1]] == board[win_combination[2]]
end

def won?(board)
  return false if board_empty?(board)
  return false if draw?(board)

  winning_combination(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  board[winning_combination(board)[0]] if won?(board) 
end
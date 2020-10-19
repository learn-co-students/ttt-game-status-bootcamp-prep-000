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
  WIN_COMBINATIONS.each do |win_combination|
    cells = []
    win_combination.each do |cell|
      cells << board[cell]
    end
    x_win = cells.all? { |index| index == "X" }
    o_win = cells.all? { |index| index == "O" }
    if x_win || o_win
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? {|cell| cell == "X" || cell == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  win_combination = won?(board)
  win_combination != false ? board[win_combination[0]] : nil
end
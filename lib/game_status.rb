# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left colunm
  [1,4,7], # middle colunm
  [2,5,8], # right colunm
  [0,4,8], # main diagonal
  [2,4,6] # inverse diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo| # check each win combo by index
    x_win = win_combo.all? do |index| # to see if all values at that index
      board[index] == "X" # are "X"
    end
    o_win = win_combo.all? do |index| # to see if all values at that index
      board[index] == "O" # are "O"
    end
    if x_win || o_win
      return win_combo
    end
  end
  false
end

def full?(board)
  board.none?{|index| index == " " || index == nil} # No empty spaces?
end

def draw?(board)
  !won?(board) && full?(board) # board both full and no winning combination
end

def over?(board)
  won?(board) || draw?(board)
end
def winner(board)
  if !won?(board)
    return nil
  end
  board[won?(board)[0]]
end

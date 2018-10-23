# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # mid row
  [6, 7, 8], # bot row
  [0, 3, 6], # left column
  [1, 4, 7], # mid column
  [2, 5, 8], # right column
  [0, 4, 8], # lft-rt diag
  [2, 4, 6]  # rt-lft diag
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    win_combo = [board[combination[0]], board[combination[1]], board[combination[2]]]
    if win_combo.all? {|play| play == "X"}
     return combination
     elsif win_combo.all? {|play| play == "O"}
      return combination
    else
      false
    end
  end
end

def full?(board)
  !board.include?(" " || "" || nil)
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

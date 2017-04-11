# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  has_won = false
  WIN_COMBINATIONS.each do |combo|
    combo_string = ""
    combo.each do |index|
      combo_string += board[index]
    end
    if combo_string == "XXX" || combo_string == "OOO"
      has_won = combo
    end
  end
  has_won
end

def full?(board)
  full = true
  board.each_with_index do |square, index|
    if valid_move?(board, index)
      full = false
    end
  end
  full
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  winstring = nil
  if won?(board)
    if board[won?(board)[0]] == "X"
      winstring = "X"
    elsif board[won?(board)[0]] == "O"
      winstring = "O"
    end
  end
  winstring
end

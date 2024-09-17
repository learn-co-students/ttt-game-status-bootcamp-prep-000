# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [0, 4, 8],
  [2, 4, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won? (board)
  WIN_COMBINATIONS.each do |win_combo|
    if ((win_combo.all? {|pos| board[pos] == "X"}) ||
      (win_combo.all? {|pos| board[pos] == "O"}))
      return win_combo
    end
  end
  nil
end

def full? (board)
  board.all? { |pos| pos == "X" || pos == "O" }
end

def draw? (board)
  full?(board) && !won?(board)
end

def over? (board)
  full?(board) || won?(board) || draw?(board)
end

def winner (board)
  if over?(board)
    if won?(board).all?{|pos| board[pos] =="X"}
      return "X"
    elsif won?(board).all?{|pos| board[pos] == "O"}
      return "O"
    else
      return nil
    end
  end
end




#     if ( board[win_combo[0]] == "X" &&
#       board[win_combo[1]] == "X" &&
#       board[win_combo[2]] == "X" )
#       true
#     elsif ( board[win_combo[0]] == "O" &&
#       board[win_combo[1]] == "O" &&
#       board[win_combo[2]] == "O")
#       true
#     else
#       false
#     end
#   end
# end




# #if (win_combo.all? { |pos| board[pos] == "X"} ||
#       win_combo.all? {|pos| board[pos] == "O"})
#       true
#     else
#       false
#     end
#   end
# end

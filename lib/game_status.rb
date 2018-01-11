# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_column_win
  [1, 4, 7], #middle_column_win
  [2, 5, 8], #right_column_win
  [0, 4, 8], #left_diag_win
  [6, 4, 2] #right_diag_win
]


def won?(board)

if WIN_COMBINATIONS.each do |win|

   if win.all? {|x| board[x] == "X"}
    return win

   elsif win.all? {|o| board[o] == "O"}
     return win

          end
      end
  else
    return false
  end
end

def full?(board)
  board.all? {|filled| filled == "X" || filled == "O"}
end



def draw?(board)
if won?(board) && full?(board) || !full?(board)
  return false
else
  return true

end
end


def over?(board)
  if draw?(board) == true || won?(board)
    return true
  else
    false
  end

end


def winner(board)
  x_won = []
  o_won = []

  board.each do |count|
    if count == "X"
      x_won << count
    elsif count == "O"
      o_won << count
    end
  end

  if o_won.length > x_won.length
    return "O"
  elsif (x_won.length > o_won.length) && won?(board) != false
    return "X"
  else
    return nil
end
end

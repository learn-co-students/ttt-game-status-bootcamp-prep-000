require 'pry'
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
  [2,4,6],
]

def won? (board)
    WIN_COMBINATIONS.each do |wincombo|
  if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
    return wincombo
  elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
    return wincombo
  end
  end
    return false
end

 def full?(board)
    board.all? {|spot| spot if spot == "X" || spot == "O"}
  #   if spot == " "
  #     return false
  #elsif won?(board) == false
  #      return true
  #  end
  #end
end


def draw?(board)
   won?(board) == false && full?(board) == true
#  if full?(board) == true
#    return true
#  else
#    return false
#  end
#end
#end
end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if win_combo = won?(board)
    index = win_combo[0]
    return board[index]

end
end

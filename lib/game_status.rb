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

def won?(board)
WIN_COMBINATIONS.each do |wincombo|
  if wincombo.all? do |square|
     board[square] == "X"
   end
     return wincombo
   elsif wincombo.all? do |square|
     board[square] == "O"
   end
     return wincombo
   end
 end
  return false
end



def full?(board)
  WIN_COMBINATIONS.each do |wincombo|
    if wincombo.any? do |square|
      board[square] == ""|| board[square] == " "
            end
      return false
    else
      return true
    end
    end
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end

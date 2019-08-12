# Helper Method


  
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]

def won?(board)
  WIN_COMBINATIONS.each do |subarr|
    if board[subarr[0]] == board[subarr[1]] && board[subarr[1]] == board[subarr[2]] && board[subarr[0]] != " "
    return  subarr
    end
  end
  return false
end

def full?(board)
board.all? {|ele| ele =="O" || ele == "X" }
end

def draw?(board)
 if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end


def winner(board)
 if won?(board)
   board[won?(board)[0]]
 end
end




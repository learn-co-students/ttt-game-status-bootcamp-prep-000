# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each{ |win_combination|
  win_temp_var_X=0
  win_temp_var_O=0
    win_combination.each{ |win_val|
      if (board[win_val]=="X")
        win_temp_var_X+=1
      elsif (board[win_val]=="O")
        win_temp_var_O+=1
      end
    }
    return win_combination if (win_temp_var_X==3 || win_temp_var_O==3)
  }
  return nil
end

def full?(board)
  board.each{|x|
    return false if x == " "
  }
  return true
end

def draw?(board)
  return true if(!won?(board)&&full?(board))
  return false
end

def winner(board)
  return board[won?(board)[0]] if (!!(won?(board)))
  return nil if (draw?(board))  #unnecessary
end

def over?(board)
  return !!(won?(board)|| draw?(board))
end

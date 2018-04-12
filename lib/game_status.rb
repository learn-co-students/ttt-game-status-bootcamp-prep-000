# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def x_and_o(board)
  x_board = []
  o_board = []
  i = 0 
  while i < board.length
    if board[i] == "X"
      x_board.push(i)
    elsif board[i] == "O"
      o_board.push(i)
    end
    i+=1 
  end
  return [x_board, o_board]
end
     
def won?(board)
  x_and_o_arr = x_and_o(board)
  res_o=[]
  res_x =[]
  WIN_COMBINATIONS.each do |possibility|
     if (x_and_o_arr[0].include?(possibility[0]) && x_and_o_arr[0].include?(possibility[1]) && x_and_o_arr[0].include?(possibility[2]))
        res_x.push(possibility)
      elsif (x_and_o_arr[1].include?(possibility[0]) && x_and_o_arr[1].include?(possibility[1]) && x_and_o_arr[1].include?(possibility[2]))
        res_o.push(possibility) 
      end
    end
    if res_o.length > res_x.length
      return res_o[0]
    else
      return res_x[0]
    end
end

def full?(board)
  x_and_o_arr = x_and_o(board)
  if x_and_o_arr[0].length + x_and_o_arr[1].length < 9
    return false
  else
    return true 
  end
end
  
def draw?(board)
  if full?(board) &! won?(board)
    return true 
  elsif won?(board)
    return false 
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  x_and_o_arr = x_and_o(board)
  res_o=[]
  res_x =[]
  WIN_COMBINATIONS.each do |possibility|
     if (x_and_o_arr[0].include?(possibility[0]) && x_and_o_arr[0].include?(possibility[1]) && x_and_o_arr[0].include?(possibility[2]))
        res_x.push(possibility)
      elsif (x_and_o_arr[1].include?(possibility[0]) && x_and_o_arr[1].include?(possibility[1]) && x_and_o_arr[1].include?(possibility[2]))
        res_o.push(possibility) 
      end
    end
    if res_o.length > res_x.length
      return "O"
    elsif res_o.length == res_x.length
      return nil
    else 
      return "X"
    end

end
  
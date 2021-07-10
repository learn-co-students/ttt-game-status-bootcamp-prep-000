# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def checkFull(board)
  board.all? do |elmt|
    elmt != "" || elmt != " "
        #!position_taken?(board, elmt.to_i)
      end
    end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal L -> R
  [2,4,6]  # Diagonal R -> L
]

def won?(board)
  if(board.any?{|i| i != "" || i != " "})
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0] # gets index positios
      win_index_2 = win_combination[1] # gets index positios
      win_index_3 = win_combination[2] # gets index positios

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if(position_1 != " " && position_1 == position_2 && position_2 == position_3)
        return win_combination
      end
    end
  end
  return false
end

def full?(board)
  i = 0
  while(i < board.length)
    if !position_taken?(board, i)
       return false
     end
     i +=1
     # elsif draw?(board)
     # return true
    end
    return true

  # if(board.all?{|i| i.empty? == false} )#&& !(won?(board)))
  #   return true
  # else #if board.any?{|i| i == "" || i == " "}
  #     return false
  #   end
end

def draw?(board)
if won?(board)
  return false
elsif full?(board)
  return true
else
  return false
  end
end

def over?(board)
  # if(draw?(board))
  #   return true
   if won?(board) || draw?(board)
     return true
  else
    return false
    end
end

def winner(board)
  if won?(board)
    arr = won?(board)
    value = arr[0]
    return board[value]
  else
    return nil
  end
end

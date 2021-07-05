# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def is_array_empty(board)
  board.all? {|c| (c==" ")||(c=="")}
end

def full?(board)
    !board.any? {|index| (index==" ")||(index=="")}
end

def draw?(board)

 if((won?(board)==false)&&(full?(board)==true))
  return true
  elsif((won?(board)==false)&&(full?(board)==false))
  return false
  else
  return false
  end
end

def over?(board)
  if((won?(board).class==Array)||(draw?(board)==true)||(full?(board)==true))
    true
  else
    false
  end
end

def winner(board)
if((won?(board).class==Array))
  temp_array = won?(board)
  index = temp_array[0]
  board[index]
 end
end


def won?(board)
  
 if((is_array_empty(board)==true)||(board == nil))
  return false
 else

  WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    

     if(((position_1=="X")&&(position_2=="X")&&(position_3=="X"))||((position_1=="O")&&(position_2=="O")&&(position_3=="O")))
      
    return win_combination
    
    else
      
      false
      
    end
  
  end
 end
 false
end
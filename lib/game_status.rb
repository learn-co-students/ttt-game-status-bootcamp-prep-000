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
  [2,4,6]]
  
#won?

def won?(board)
  
  #conditional for empty board
  
  if board.none? {|i| i == "X" || i == "O"}
    return FALSE
  end
  
  #iterate over win combination
  
  WIN_COMBINATIONS.each do |win_combination| 
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    #conditional for X win
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return [win_index_1, win_index_2, win_index_3]
    
    #conditional for O win
      
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return [win_index_1, win_index_2, win_index_3]
      
    end
  end
  
  if full?(board)
    return FALSE
  end
  
end

#full?
  
def full?(board)
  board.none? {|i| i.nil? || i == " "}
end
     
#draw?
  
def draw?(board)
  if (won?(board) == FALSE && full?(board) == TRUE)
    TRUE
  elsif (won?(board) == FALSE && full?(board) == FALSE)
    FALSE
  else
    FALSE
  end
end
  
#over?
  
def over?(board)
  if won?(board)
    TRUE
  elsif draw?(board)
    TRUE
  else 
    FALSE
  end
end

#winner

def winner(board)
  if won?(board)
    temp_array = won?(board)
    return board[temp_array[0]]
    
  else return nil
    
  end
end
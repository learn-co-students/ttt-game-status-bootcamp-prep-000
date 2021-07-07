# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
def won?(board) 
 result = false
 WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X" 
          result = win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          result = win_combination
        else 
          
      end
      
  end
  
  result

end

def full?(board)
  board.none? { |value| value == " " }
end
  
def draw?(board)
  status = ""
  if won?(board) == false && full?(board) == true
      status = true
    elsif won?(board) == false && full?(board) == false
      status = false
    elsif won?(board) != false 
     status = false
   end
   status
 end
    
def over?(board)
  status = false
  if won?(board) != false || draw?(board) == true || full?(board) == true
      status = true
  end
  status
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end
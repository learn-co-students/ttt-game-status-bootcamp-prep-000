# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5] ,[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |place|
   
    win1 = place[0]
    win2 = place[1]
    win3 = place[2]
    
    win_char1 = board[win1]
    win_char2 = board[win2]
    win_char3 = board[win3]
    
    if (win_char1 == "X" && win_char2 =="X" && win_char3 == "X")||(win_char1 == "O" && win_char2 =="O" && win_char3 == "O")
      return place
      end
  end 
  return false
end 


def full?(board)
    board.each do |check|
      if check == "" || check == " "  
      return false
      end
    end
    return true
end

def draw?(board)
    if full?(board) == true && won?(board) == false
    return true  
  else return false
end
end 


def over?(board)

  if won?(board) != false || draw?(board) == true
  return true
  end
 return false
end

def winner(board)
if over?(board) == true
  if board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
    end 
end
end
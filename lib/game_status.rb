# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

 WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
 def won?(board)
   contains_X = board.include?("X")
   contains_O = board.include?("O")
   if contains_O == false && contains_X == false 
     return false
     
   else
     
    if (board[WIN_COMBINATIONS[0][0]]== "X" && board[WIN_COMBINATIONS[0][1]]== "X" && board[WIN_COMBINATIONS[0][2]]=="X") || (board[WIN_COMBINATIONS[0][0]]== "O" && board[WIN_COMBINATIONS[0][1]]== "O" && board[WIN_COMBINATIONS[0][2]]=="O")
      
      return WIN_COMBINATIONS[0]
      
    elsif (board[WIN_COMBINATIONS[1][0]]== "X" && board[WIN_COMBINATIONS[1][1]]== "X" && board[WIN_COMBINATIONS[1][2]]=="X") || (board[WIN_COMBINATIONS[1][0]]== "O" && board[WIN_COMBINATIONS[1][1]]== "O" && board[WIN_COMBINATIONS[1][2]]=="O")
    
      return WIN_COMBINATIONS[1]
      
     elsif (board[WIN_COMBINATIONS[2][0]]== "X" && board[WIN_COMBINATIONS[2][1]]== "X" && board[WIN_COMBINATIONS[2][2]]=="X") || (board[WIN_COMBINATIONS[2][0]]== "O" && board[WIN_COMBINATIONS[2][1]]== "O" && board[WIN_COMBINATIONS[2][2]]=="O")
     
     return WIN_COMBINATIONS[2]
     
      elsif (board[WIN_COMBINATIONS[3][0]]== "X" && board[WIN_COMBINATIONS[3][1]]== "X" && board[WIN_COMBINATIONS[3][2]]=="X") || (board[WIN_COMBINATIONS[3][0]]== "O" && board[WIN_COMBINATIONS[3][1]]== "O" && board[WIN_COMBINATIONS[3][2]]=="O")
      
      return WIN_COMBINATIONS[3]
      
       elsif (board[WIN_COMBINATIONS[4][0]]== "X" && board[WIN_COMBINATIONS[4][1]]== "X" && board[WIN_COMBINATIONS[4][2]]=="X") || (board[WIN_COMBINATIONS[4][0]]== "O" && board[WIN_COMBINATIONS[4][1]]== "O" && board[WIN_COMBINATIONS[4][2]]=="O")
       
       return WIN_COMBINATIONS[4]
       
        elsif (board[WIN_COMBINATIONS[5][0]]== "X" && board[WIN_COMBINATIONS[5][1]]== "X" && board[WIN_COMBINATIONS[5][2]]=="X") || (board[WIN_COMBINATIONS[5][0]]== "O" && board[WIN_COMBINATIONS[5][1]]== "O" && board[WIN_COMBINATIONS[5][2]]=="O")
        
        return WIN_COMBINATIONS[5]
        
         elsif (board[WIN_COMBINATIONS[6][0]]== "X" && board[WIN_COMBINATIONS[6][1]]== "X" && board[WIN_COMBINATIONS[6][2]]=="X") || (board[WIN_COMBINATIONS[6][0]]== "O" && board[WIN_COMBINATIONS[6][1]]== "O" && board[WIN_COMBINATIONS[6][2]]=="O")
         
         return WIN_COMBINATIONS[6]
         
          elsif (board[WIN_COMBINATIONS[7][0]]== "X" && board[WIN_COMBINATIONS[7][1]]== "X" && board[WIN_COMBINATIONS[7][2]]=="X") || (board[WIN_COMBINATIONS[7][0]]== "O" && board[WIN_COMBINATIONS[7][1]]== "O" && board[WIN_COMBINATIONS[7][2]]=="O")
          
          return WIN_COMBINATIONS[7]
         else 
           return false
     end
   
   end
   end
   
   
   def full?(board)
     
     if board.include?(" ")
        return false
      else 
        return true
    end
   end
   
  def draw?(board)
    isWon = won?(board)
    isFull = full?(board)
    if isWon == false && isFull == true
      return true
    else
      return false
    end
  end
    
def over?(board)
   isWon_Over = won?(board)
   isFull_Over = full?(board)
   isDraw_Over = draw?(board)
   
   if isWon_Over != false || isFull_Over == true || isDraw_Over == true
     return true
   else
     return false
   end
   
end

def winner(board)
  isWon_winner = won?(board)
  if isWon_winner != false 
    return board[isWon_winner[0]]
  end
end
 


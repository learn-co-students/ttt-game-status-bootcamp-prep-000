# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #Middle row
  [6,7,8], #bottom row
  [0,3,6], #left column 
  [1,4,7], #middle column
  [2,5,8], #Right column
  [2,4,6], #left to right diagonal
  [0,4,8], #Right to left diagonal
]
   
   
#    board = ["O", " ", "X", "O", " ", "X", "O", " ", " "]

def won?(board)
  WIN_COMBINATIONS.find  do | win_combination |
  
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
       
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
   
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
end
   
def full?(board)
  ret = board.detect do | tokens |
   tokens == " "
 end
!ret 
end



 def draw?(board)
   full?(board) && !won?(board)
   end 
   
   

def over?(board)
   won?(board) || full?(board) 
  
end

def winner(board)
 if token_getter = won?(board)
  board[token_getter[1]]
  end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
# # Helper Method

require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def input_to_index(user_input)
  user_input = user_input.to_i-1
  puts user_input
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
  [2,4,6]
  ]


def won?(board)
 WIN_COMBINATIONS.each do |combo| 
  if position_taken?(board, combo[0]) && board[combo[0]] === board[combo[1]] && board[combo[1]] === board[combo[2]] 
   return combo
end 
end
return false
end 
 


def full?(board)
  if board.all? {|token| token == "X" || token == "O"} 
      return true
    end
  return false 
end 

def draw?(board)
if full?(board) && !(won?(board)) 
  true  
else false 
end 
end 

def over?(board)
if draw?(board) || won?(board)
  true
else false 
end 
end 


def winner(board) 
  if won?(board)
    WIN_COMBINATIONS.each do |combo| 
      if position_taken?(board, combo[0]) && board[combo[0]] === board[combo[1]] && board[combo[1]] === board[combo[2]] 
    return board[combo[0]]   
end 
end
end 
end 
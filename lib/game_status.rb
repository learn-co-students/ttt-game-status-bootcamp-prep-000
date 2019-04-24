# # Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# def input_to_index(user_input)
#   user_input = user_input.to_i-1
#   puts user_input
# end 

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
  win = false 
 WIN_COMBINATIONS.each do |combo| 
  if position_taken?(board, combo[0]) && board[combo[0]] === board[combo[1]] && board[combo[1]] === board[combo[2]] 
    win = true 
   return combo
 else return false 
end
end
end 
 
# # && 
# #     won = true 
#   board.all? || board.none?)

def full?(board)
# board.map do |index|
# end
end

# def draw?(board)
#   if board[combo] === false
#     return true 
#   end 
# end

# def over?(board)
# if draw? === true 
# else if won? === true 
# return true
# else
#   return false 
# end
# end
# end 


# # def winner() 
# # end 

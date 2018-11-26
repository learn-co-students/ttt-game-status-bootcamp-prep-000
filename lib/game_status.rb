# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# def input_to_index(user_input)
#   user_input = user_input.to_i-1
#   # puts user_input
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
    WIN_COMBINATIONS.each do |combo|
    if board[combo[0]]== board[combo[1]] && board[combo[1]] == board[combo[2]]
      puts "#{board[combo]}"
    else 
      return false
end
end
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant (note: constants start with capital letters)
WIN_COMBINATIONS = [
  [0,1,2], # Top row across
  [3,4,5], # Middle row across
  [6,7,8], # Bottom row across
  [0,3,6], # left row down
  [1,4,7], # center row down
  [2,5,8], # right row down
  [0,4,8], # diagonal left to right corner
  [2,4,6], # diagonal right to left corner
]


def won?(board)
#for each win_combination in WIN_COMBINATIONS
WIN_COMBINATIONS.find do |win_combination| # find instead of each??
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      puts win_combination # output win_combination so i can see what the hell is happening
      true # not 'return true', just 'true' -- find method looks for what evaluates to true and returns the element that caused the true evaluation
    else
      false # not 'return false', just 'false' -- see above note for 'true'
    end # end if...else statement

  end # end for-each-loop... AKA WIN_COMBINATIONS.each do |win_combination|

  #puts win_combination
  #return win_combination # return the win_combination indexes that won.

end # end method



#methods to make for this lesson::::
# def won?(board)
#   #match_array = []
#   #winning_array = ["X", "X", "X"] || ["O", "O", "O"] # or ["X, X, X"] ???  #needs to be =, not ==
#   #winning_array == (position_taken?(board, "X")) || (position_taken?(board, "O"))
#
#   if draw?(board) # == true
#     return false
#   elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] # empty board
#     return false
#
# #[1,2,3,4].detect{|i| i.is_a?(String)}
# #[WIN_COMBINATIONS].detect{|win_combination| win_combination.is_a?("X, X, X")}
#
# #counter = 0 #counter is set to 0 before the for each loop interation begins
#
#   elsif WIN_COMBINATIONS.each do |win_combination| # win_combination is an element that = [0, 1, 2]... index = winning_array
#   #elsif WIN_COMBINATIONS.find do |win_combination| # win_combination is an element that = [0, 1, 2]... index = winning_array
#       #if (win_combination == ["X", "X", "X"]) || (win_combination == ["O", "O", "O"])
#       #end # end if within for-each-loop AKA WIN_COMBINATIONS.each do block
#             #counter += 1 #adding 1 to the counter for each "X" and "O" in the board array
#         puts "#{win_combination}"
#         return win_combination
#       end # end for-each-loop AKA WIN_COMBINATIONS.each do block
#
#     end # end if...elsif statement
# end # end won?board method



def full?(board)
end


def draw?(board)
  # if (won? == false) && (full? == true) # if not won and full board
  #   return true # it is a draw
#   elsif !won? && !full? # if not won and board is not full
#     return false # it is NOT a draw
   #end # end if statement
end # end method


def over?(board)
end


def winner(board)
end

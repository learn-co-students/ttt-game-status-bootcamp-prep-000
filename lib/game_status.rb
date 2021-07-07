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
end # end method



def full?(board)  ###### this method works, but this can be written more clearly <<<----
  board.all? do |positions|
    #puts "The #{board.length} position is #{positions}"

  if positions == " "
    puts "The board is NOT full, there are some empty spaces."
  #if board.all? { |obj| obj }
    false
  elsif (positions == "X") || (positions == "O")
  #elsif board.all?
    puts "The board is full!"
    true
    end # end if...else statement
  end # end for each loop
end # end full? method

#####another way to do it, much simpler... this is how a Learn.co instructor said it could be done:
# def full?(board)
#   board.all?{|token| token == "X" || token == "O"}
# end



def draw?(board)
  if !won?(board) && full?(board) # if not won and full board
    puts "The game is a draw. No one wins."
    true # it is a draw
  elsif !won?(board) && !full?(board) # if not won and board is not full
    puts "The board is not full yet, so it can't be a draw."
    false # it is NOT a draw
   end # end if statement
end # end method


def over?(board)
  if draw?(board)
    puts "The game is over. It was a draw."
    true
  elsif won?(board)
    puts "The game is over. There was a winner!"
    true
  else
    puts "The game is not over yet."
    false
  end # end if...elsif..else statement
end # end method



# def winner(board)
#   if won?(board) == true
#     #&& (position_1 == "X")
#     puts "X is the winner!"
#     return "X"
#     true
#   end # end if statement
# end #end method


##another way to do winner(board), by copying won?(board):::
#def winner(board) # same as won?(board) method #### <<<<-------- better way to do this???

def winner(board)
  if won?board
    if board[won?(board)[0]] == "X"
      puts "X is the winner!"
      return "X"
    elsif board[won?(board)[0]] == "O"
      puts "O is the winner!"
      return "O"
    end # end if..else statement
  else !won?(board)
    nil ###this nil is returned outside the if..elsif statement, which is inside the if won?board statement
  end # end if won?board statement
end # end method

####### super small version::::::::
# def winner(board)
#   if won?(board)
#     puts "#{board[won?(board)[0]]} is the winner"
#     return board[won?(board)[0]]
#   end
# end

# ##another way to do winner(board), by copying won?(board):::
# def winner(board) # same as won?(board) method #### <<<<-------- better way to do this???
# WIN_COMBINATIONS.find do |win_combination| # find instead of each??
#   # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
#   # grab each index from the win_combination that composes a win.
#
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]
#
#   position_1 = board[win_index_1] # load the value of the board at win_index_1
#   position_2 = board[win_index_2] # load the value of the board at win_index_2
#   position_3 = board[win_index_3] # load the value of the board at win_index_3
#
#     if (position_1 == "X" && position_2 == "X" && position_3 == "X")
#       puts win_combination # output win_combination so i can see what the hell is happening
#       puts "X is the winner!"
#       return "X" # it is a string, so it's in quotes
#       #true # not 'return true', just 'true' -- find method looks for what evaluates to true and returns the element that caused the true evaluation
#     elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
#       puts win_combination # output win_combination so i can see what the hell is happening
#       puts "O is the winner!"
#       return "O" # it is a string, so it's in quotes
#       #true # not 'return true', just 'true' -- find method looks for what evaluates to true and returns the element that caused the true evaluation
#     else
#       false # not 'return false', just 'false' -- see above note for 'true'
#     end # end if...else statement
#   end # end for-each-loop... AKA WIN_COMBINATIONS.each do |win_combination|
# end # end method

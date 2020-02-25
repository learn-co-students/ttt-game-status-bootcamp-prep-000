
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
      [6,4,2],
]

def won?(board)

  WIN_COMBINATIONS.detect do |e|
  board[e[0]] == board[e[1]] && 
  board[e[1]] == board [e[2]] &&
  position_taken?(board, e[0])

 end
end

def full?(board)
  board.all? do |e| e == "X" || e == "O" end
  # if board.any? == true
  # else board.empty? == false
  # end

  # if board.any? == "X" && board.any? == "O"
  # else position_taken? == false
  # end

    # if board.each do |n| n == "X" &&
    #     board.each do |n| n == "O"
    # false
    # end
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
if winning_board = won?(board)
  board[winning_board[0]]
  # elsif
  #   false
  end
  # won?(board) == true
  # puts "X"
end
# Pseudo code  for  #winner?


# Identify the problem
# Need to know who won game

# Identify the output that would solve the problem 
# return the token, "X" or "O" that has won the game given a winning board

# Name the Procedure That Fixes the Problem
# If won return type of toke won

# Identify What Inputs are Needed to Create the Output
# Board
# #won? 
# Token : x or o

# Define the Procedure’s Implementation

# return type winning token (board, method, token vale):
#  winning board = won?(board)
# If winning board return type of token that won
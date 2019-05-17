# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[1,4,7],[2,4,6],[0,3,6],[2,5,8]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      #check the win combination for an X win
      return combination
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      #check the win combination for an O win
      return combination
    #otherwise, the game has not been won
    end
  end
false
end

=begin #detect/find
  WIN_COMBINATIONS.find do |combination|
    board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
      board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
  end
end
=end

def draw?(board)  #should return true if the board is full and no winner
  if full?(board) && !won?(board)
    true
  else
    false
  end
end



def full?(board)
  if board.include?(" ") #if the board includes a blank space, #full is false
  else
    true   #if the board is full, #full is truthy
  end
end


#need to get won?(board) into this method, as an in progress board can still end the game!!
def over?(board)
  unless full?(board) #if board is full, winner or not, the game is over
    false
  else    #if the board is not full, game is in progress
      true
    end
  end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
end #if won?(board), return board[conbination[]] to identify winner
end

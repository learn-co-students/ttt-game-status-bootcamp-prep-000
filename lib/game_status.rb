# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],  #horizontal
  [0,3,6],[1,4,7],[2,5,8],  #vertical
  [0,4,8],[2,4,6]           #diagonal
]

def won?(board)
  if board.all? {|space| space == " "}
    return false
  end

  WIN_COMBINATIONS.each do |combination| #for each combination
    win_index_1 = combination[0]
    win_index_2 = combination[1] 
    win_index_3 = combination[2] 
    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]
    
    #if all of the "win" spaces of board are X or O
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return combination #return the entire array that won
    end #end if
  end #end iteration of WIN_COMBINATIONS
  
  if full?(board)
    return false #if no winner was found in the loop, that means the combination wasn't returned, so there's a draw if full.
  end #end if
end #end won?

def draw?(board)
  if !won?(board) && full?(board)                       #if the board is full and there was no winner, return true.
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)  #otherwise if there is no winner & board is not full, no draw.
    return false
  end
end

def full?(board) 
  board.any?{|space| space == " "} ? false : true       #if any spaces are blank, return false.
end

def over?(board)
  if draw?(board) #if there is a draw
    return true
  elsif (won?(board) && !full?(board)) || (won?(board) && full?(board)) #if the game is won on a full or not full board
    return true
  else
    return false
  end
end

def winner(board)
  combination = won?(board) #if there is a winner it will return the combination
  if !over?(board) #if there is no draw or no winner the game is not over yet
    return nil 
  elsif board[combination[0]] == "X" #if the first winning index of board is "X" 
    return "X"
  else # otherwise, the game must be over, not a draw, & the winning player isn't "X" so it must be "O"
    return "O"
  end
end

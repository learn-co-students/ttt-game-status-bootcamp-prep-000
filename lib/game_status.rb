# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  
  #grab each index from WIN_COMBINATIONS that composes a win  
  WIN_COMBINATIONS.each do |element|
    #element is each sub array in WIN_COMBINATIONS ex. [0,1,2]
    win_index_1 = element[0]
    win_index_2 = element[1]
    win_index_3 = element[2]
    #win_index_ is the position on the board inside the sub array for a winning combination


    #position_ gives you the X's and O's at the position in the board
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    position_array = [position_1,position_2,position_3]
    
    #tests to see if all of the positions in the array are O's
    all_O = position_array.all? do|element|
      element == "O"
    end
    
    #tests to see if all of the positions in the array are X's
    all_X = position_array.all? do|element|
      element == "X"
    end
    
      if ( (position_taken?(board,win_index_1)) && (position_taken?(board,win_index_2)) && (position_taken?(board,win_index_3)) )
        if (all_X  || all_O)
         return element
        end
      end
    end
    return false
  
end

def full?(board)
  #return true if every element in the board contains something
  all_full = board.all? do |element|
    element != " "
  end
end

def draw?(board)
  if ( !(won?(board)) && full?(board) ) #true if board has not been won and is full
    return true
  elsif ( !(won?(board))  && !(full?(board)) ) #false if board has not been won and is not full
    return false
  elsif (won?(board))   #return false if board is won
    return false
  end
    
end

def over?(board)
  #returns true if the board is won, is a draw or is full
  if ( won?(board) || draw?(board) || full?(board))
    return true
  end
end

def winner(board)
  #return token x or o that won the game
  
  if ( won?(board) )
    position_array = []
    (won?(board)).each do |element|
      position_array << board[element]
    end
    all_X = position_array.all? do|element|
        element == "X"
    end
    if (all_X )
      return "X"
    else
      return "O"
    end
  end
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
  [6,4,2]
  ]
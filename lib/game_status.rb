# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [2,4,6],
]

def won?(board)
  #check to see if there's any winning combinations and return the winning combo (an array if there is) & false if there isn't
  array_count = 0
  while array_count <= 7
    win_index_1 = WIN_COMBINATIONS[array_count][0]
    win_index_2 = WIN_COMBINATIONS[array_count][1]
    win_index_3 = WIN_COMBINATIONS[array_count][2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"

      return WIN_COMBINATIONS[array_count]
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return WIN_COMBINATIONS[array_count]
    else
      array_count = array_count + 1
    end
  end
  #if the loop the finished without returning any arrays that means it didn't a winning combination of letters
  #so return false?
  return false
end

#returns true if every element in the board array is occupied by a letter 'X' or 'O'
#or another way to look at it would be to like to say there's no " " empty spaces
#which is easier to check?
def full?(board)
  return !(board & [" ", "", nil]).any?
end

# NEEDS TO RETURN FALSE IS THE BOARD IS WON (DUH) -- check
# FULL? EQUALS TRUE && WON == FALSE -> DRAW NEEDS TO RETURN TRUE -- check
# NEEDS TO RETURN FALSE IF BOARD IS NOT WON AND BOARD IS NOT FULL
def draw?(board)
  if won?(board) == false
    return true
  elsif full?(board) == true && won?(board) == false
    return true
  elsif full?(board) == false && won?(board) == false
    return false
  end
end



def over?(board)
  if full?(board) == false && won?(board) == false
    return false
  end
  if full?(board) == false && won?(board) != false
    return true
  end
  if won?(board) != false && full?(board) == true
    return true
  end
  if draw?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) != false
    array_count = 0
    while array_count <= 7
      win_index_1 = WIN_COMBINATIONS[array_count][0]
      win_index_2 = WIN_COMBINATIONS[array_count][1]
      win_index_3 = WIN_COMBINATIONS[array_count][2]
      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      else
        array_count = array_count + 1
      end
    end
  end
end

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
  [2,4,6]
]

def won?( board )
  # Return indexes if there is a win, otherwise nil
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end

  end  # do end

  return nil

end  # won end

def full?( board )
  return !board.detect{|i| i==" "}
end

def draw?( board )

  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end

end  # End draw

def over?( board )

  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end

end

def winner( board )

  myWinner = won?(board)

  if myWinner == nil
    return myWinner
  end

  return board[myWinner[0]]

end

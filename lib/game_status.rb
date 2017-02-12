# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #Top row
  [3,4,5],  #Middle row
  [6,7,8],  #Bottom row
  [0,3,6],  #First column
  [1,4,7],  #Second column
  [2,5,8],  #Third column
  [0,4,8],  #First diagonal
  [2,4,6]   #Second diagonal
]

def won?(board)
#for each win_combination in WIN_COMBINATIONS grab each index from the
#win_combination that composes a win.
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    #return the win_combination indexes that won.
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  #return false or nil if there is no winning combination
  false
end

def full?(board)
  #if no empty spaces return true
  !board.include? " "
end

def draw?(board)
  #returns true if the board has not been won and is full
  if !won?(board) && full?(board)
    true
  #returns false if the board is won
  else
    false
  end
end

def over?(board)
  #returns true if the board has been won, is a draw, or is full
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    #call won for the winning combination
    winning_combo = won?(board)
    #match winning combo against the board
    winner_position = winning_combo[0]
    #if includes X return X, else return O
    if board[winner_position] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

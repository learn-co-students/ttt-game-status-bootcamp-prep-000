# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top Row
  [3, 4, 5], #Middle Row
  [6, 7, 8], #Bottom Row

  [0, 3, 6], #Left column
  [1, 4, 7], #Middle Column
  [2, 5, 8], #Right column

  [0, 4, 8], #First diagonal
  [6, 4, 2] #Second diagonal
]

def won?(board)
  matches = []

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] #load value of board at win_index_1
    position_2 = board[win_index_2] #load value of board at win_index_2
    position_3 = board[win_index_3] #load value of board at win_index_3

    #If you have a combination of all Xs or all Os
    if(position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
      #return the combination of indexes that wom
      return win_combination
      #add win combination to empty array matches
      matches << win_combination
    else
      matches = nil
    end
  end
  return matches
end

#
def full?(board)
  board.each do |element|
    #If there is a space the board isn't full, return false
    if element == " "
      return false
    end
  end
      return true
end

def draw?(board)
  #If a player won, do not draw
  if won?(board)
    return false
  #Draw new if no one won and the game board is full
  elsif !won?(board) && full?(board)
    return true
  #Do not draw if no one has won and the board isn't full
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  #If someone won, you're at a draw or it's full, game is over
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  #Defines token as empty
  token = nil
  winner_player = won?(board)
  #If winning player, return position and token of position as X or O
  if winner_player
    if winner_player.class == Array
      position = winner_player[0]
      token = board[position]
    end
  end

end

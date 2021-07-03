# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  counter = 0
  while counter < WIN_COMBINATIONS.length

    win_index_1 = WIN_COMBINATIONS[counter][0]
    win_index_2 = WIN_COMBINATIONS[counter][1]
    win_index_3 = WIN_COMBINATIONS[counter][2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return WIN_COMBINATIONS[counter] # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return WIN_COMBINATIONS[counter]
    else
      counter += 1
    end
  end
end

def full?(board)
  board.none? do |i| i == " "
  end
end

def draw?(board)
# returns true if the board has not been won and is full
#false if the board is not won and the board is not full, and false if the board is won.
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
#that accepts a board and returns true if the board has been won, is a draw, or is full
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  counter = 0
  while counter < WIN_COMBINATIONS.length

    win_index_1 = WIN_COMBINATIONS[counter][0]
    win_index_2 = WIN_COMBINATIONS[counter][1]
    win_index_3 = WIN_COMBINATIONS[counter][2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X" # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      counter += 1
    end
  end
end

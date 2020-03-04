# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # horizontal first row
  [3, 4, 5], # horizontal middle row
  [6, 7, 8], # horizontal last row

  [0, 3, 6], # vertical first row
  [1, 4, 7], # vertical middle row
  [2, 5, 8], # vertical last row

  [0, 4, 8], # diagonal first row
  [2, 4, 6]  # diagonal last row
]

def won?(board)
  '''
  for each win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
  '''
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    # checks if X won
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end

    # checks if O won
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end

  return nil
end

def full?(board)
  if (board.detect{|i| i == " "} != nil)
    return false
  end

  return true
end

def draw?(board)
  if (full?(board) && !(won?(board)))
    return true
  end

  return false
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  end
  return false
end

def winner(board)
  winning_coords = won?(board)
  if (winning_coords != nil)
    if    (board[ winning_coords[0] ] == "X")
      return "X"
    elsif (board[ winning_coords[0] ] == "O")
      return "O"
    end
  end

  return nil
end

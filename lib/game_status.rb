# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # diagonal 1
  [2, 4, 6]  # diagonal 2
]

def won?(board)
  #true for win, false for not
  #return the winning combination indexes as array - not who won
  #iterate over WIN_COMBINATIONS
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  WIN_COMBINATIONS.each do |win_combination|
    # grab each index from the win_combination that composes a win:
    win_index_1 = win_combination[0] # this is the first index of each given win combination, i. e. 3 for middle row or 2 for diagonal 2 win
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    # define positions on my board that i am checking
    position_1 = board[win_index_1] # this defines position 1 to be the index in my game board that matches the first position in a winning combination
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? { |e| (e == "X" || e == "O") }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  if !won?(board) && !full?(board)
    return false
  end
  if won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  win_combination = won?(board)
  if won?(board) == false
    return nil
  else
    if board[win_combination[0]] == "X"
      return "X"
    elsif board[win_combination[0]] == "O"
      return "O"
    end
  end
end

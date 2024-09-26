# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #slash
  [2, 4, 6] #backslash
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0] #first position in winning combo
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] #what's in that position on board?
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
    end
  end
end

def full?(board)
  board.all? do |space|
    (space == "X" || space == "O")
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if (full?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  check_board = won?(board)
  if check_board.class == Array
    return board[check_board[0]]
  else
    nil
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  # Row
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # Col
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # Diagonal
  [0,4,8],
  [2,6,4]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_x = win_combination.all? do |win_index|
      (board[win_index] == "X")
    end
    win_o = win_combination.all? do |win_index|
      (board[win_index] == "O")
    end
    if win_x || win_o
      return win_combination
    end
  end
  return false # should not be reached unless all win combinations not present
end

def full?(board)
  [0,1,2,3,4,5,6,7,8].all? do |place|
    position_taken?(board, place)
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) ||  full?(board) ? true : false
end

def winner(board)
  win_indexes = won?(board)
  if win_indexes == false
    return nil
  else
    return board[win_indexes[0]]
  end
end

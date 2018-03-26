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

def won? (board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return [win_index_1, win_index_2, win_index_3]
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return [win_index_1, win_index_2, win_index_3]
    end
  end
  return false
end

def full? (board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw? (board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over? (board)
  won?(board) || full?(board) || draw?(board)
end

def winner (board)
  result = won?(board)
  if !result
    return nil;
  end
  win_index_1 = result[0]
  return board[win_index_1]
end

    
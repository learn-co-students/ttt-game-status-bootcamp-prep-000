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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
    return false
end

def full?(board)
  counter = 0
  board.each do |position|
    if position == nil || position == " "
      counter += 1
    end
  end
  if counter > 0
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
  return true
  end
  return false
end

def over?(board)
  if won?(board) != false || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board) != false && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) != false && board[won?(board)[0]] == "O"
    return "O"
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    win_x = win_array.select do |win_sequence|
      board[win_sequence] == "X"
    end
    win_o = win_array.select do |win_sequence|
      board[win_sequence] == "O"
    end
    if win_x.length == 3
      return win_x
    elsif win_o.length == 3
      return win_o
    end
  end
  state = true
  board.each do |position|
    if position != " "
      state = false
    end
  end
  if state == true
    return false
  end
end

def full?(board)
  board.none? do |position|
    position == " "
  end
end

def draw?(board)
  if won?(board).class == Array
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board).class == Array
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).class == Array
    state = won?(board)
  else
    state = [9]
  end
  if board[state[0]] == "X"
    return "X"
  elsif board[state[0]] == "O"
    return "O"
  else
    return nil
  end
end

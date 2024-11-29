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

def check(board, token='X')
  return state = WIN_COMBINATIONS.detect do |one_state|
    one_state.all? { |i| board[i] == token}
  end
end

def won?(board)
  x_state = check(board, 'X')
  o_state = check(board, 'O')
  if x_state != nil
    return x_state
  elsif o_state != nil
    return o_state
  end
  return false
end

def full?(board)
  empty = board.detect do |cell|
    cell == " " || cell == nil
  end
  if empty == nil
    return true
  end
  false
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  end
  return false
end

def winner(board)
  if check(board, 'X')
    return 'X'
  elsif check(board, 'O')
    return 'O'
  end
  nil
end

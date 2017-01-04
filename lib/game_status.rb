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
  ["X", "O"].each do |symbol|
    WIN_COMBINATIONS.each do |win_combination|
      all_equal = win_combination.all? do |position|
        board[position] == symbol
      end
      if all_equal
        return win_combination
      end
    end
  end
  return false
end

def full?(board)
  board.each_with_index do |position, index|
    if !position_taken?(board, index)
      return false
    end
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
  return false
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end

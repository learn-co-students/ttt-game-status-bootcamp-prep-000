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
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end

def full?(board)
  position_statuses = []
  board.each_with_index { |position, index| position_statuses << position_taken?(board, index)}
  if position_statuses.all? {|position_status| position_status == true}
    return true
  else
    return false
  end
end

def draw?(board)
  if (won?(board) == false || won?(board) == nil) && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

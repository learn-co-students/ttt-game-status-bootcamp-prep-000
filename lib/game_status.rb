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
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|index| board[index] == "X"}
      return combination
    elsif combination.all? {|index| board[index] == "O"}
      return combination
    end
  end
  return false
end

def full?(board)
  return board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return true
  end
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    return board[winning_combo[0]]
  else return nil
  end
end

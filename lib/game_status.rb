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
  WIN_COMBINATIONS.each do |combo|
    x, y, z = combo

    if [board[x], board[y], board [z]].all? {|i| i == "X"}
      return combo
    elsif [board[x], board[y], board [z]].all? {|i| i == "O"}
      return combo
    end
  end
  return nil
end

def full?(board)
  board.none? {|i| i == " "}
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  end
  return false
end

def winner(board)
  winner = nil
  if won?(board)
    WIN_COMBINATIONS.each do |combo|
      x, y, z = combo

      if [board[x], board[y], board [z]].all? {|i| i == "X"}
        winner = "X"
      elsif [board[x], board[y], board [z]].all? {|i| i == "O"}
        winner = "O"
      end
    end
  end
  winner
end

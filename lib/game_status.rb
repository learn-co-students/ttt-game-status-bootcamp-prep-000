# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Left to right diagonal
  [2, 4, 6], # Right to left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |e|
    index1 = e[0]
    index2 = e[1]
    index3 = e[2]

    position1 = board[index1]
    position2 = board[index2]
    position3 = board[index3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return e
    end

    if position1 == "O" && position2 == "O" && position3 == "O"
      return e
    end
  end

  return false

end

def full?(board)
  board.all? { |e| e == "X" || e == "O"}
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) ||full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  end
  winner_index = won?(board)[0]
  board[winner_index]
end

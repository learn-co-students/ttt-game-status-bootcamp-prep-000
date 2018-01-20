# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return combo
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  false
end

def full?(board)
  if (board.include? " ")
    return false
  end
  return true
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  end
  return false
end

def over?(board)
  if (won?(board) || full?(board))
    return true
  end
  return false
end

def winner(board)
  if !won?(board)
    return nil
  elsif (won?(board) && board[won?(board)[0]] == "X")
    return "X"
  elsif (won?(board) && board[won?(board)[0]] == "O")
    return "O"
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
board = ["O", "O", "X", "X", "X", "O", "O", "X", "O"]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #top column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #top left diagonal
  [2, 4, 6], #top right diagonal
]

def won? (board)
  #if board contains any win combo return true
  #iterate through board
  #won = false
  WIN_COMBINATIONS.each do |winPos|
  #  puts(" Win Position 1: #{winPos[0]} Position 2: #{winPos[1]} Win Position 3: #{winPos[2]}")
    if board[winPos[0]] == "X" && board[winPos[1]] == "X" && board[winPos[2]] == "X"
      return winPos
    end
    if board[winPos[0]] == "O" && board[winPos[1]] == "O" && board[winPos[2]] == "O"
      return winPos
    end
  end
  return false
end

def full?(board)
  board.all? do |section|
    section == "X" || section == "O"
  end
end

def draw?(board)
  if full?(board)
    if won?(board) == false
      return true
    end
  end
  return false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winningBoard = won?(board)
    puts("winning board is #{winningBoard}")
    if board[winningBoard[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

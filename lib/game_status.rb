# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [2, 5, 8],
  [1, 4, 7],
  [0, 3, 6],
]

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    board[winner[0]] == board[winner[1]] &&
    board[winner[1]] == board[winner[2]] &&
    position_taken?(board, winner[0])
  end
end

def full?(board)
  counter = 0
  board.select do |check|
    if check == "X" || check == "O"
      counter += 1
    end
  end
  if counter == board.length
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
 if draw?(board) || won?(board) || full?(board)
   return true
 else
   return false
 end
end

def winner(board)
  if won?(board)
    win_check = won?(board)
    return board[win_check[0]]
  else
    return nil
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    idx1 = combo[0]
    idx2 = combo[1]
    idx3 = combo[2]

    if board[idx1] == "X" && board[idx2] == "X" && board[idx3] == "X"
      return combo
    elsif board[idx1] == "O" && board[idx2] == "O" && board[idx3] == "O"
      return combo
    end
  end

  false
end

def full?(board)
  board.all? { |space| space != " " }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  elsif won?(board)
    false
  end
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)

  if winning_combo
    board[winning_combo[0]]
  end
end

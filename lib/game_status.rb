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
  winner = false
  winning_combination = false
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      winner = true
      winning_combination = win_combination
      break
    end
  end
  if winner == true
    return winning_combination
  elsif winner == false
    false
  end
end

def full?(board)
  if board.none? {|space| space == " "}
    true
  end
end

def draw?(board)
  if won?(board) == false && board.none? {|space| space == " "}
    true
  end
end

def over?(board)
  if !!won?(board) || draw?(board) == true
    true
  end
end

def winner(board)
  winner = false
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      winner = "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      winner = "O"
    end
  end
  if !!winner
    winner
  else
    nil
  end
end

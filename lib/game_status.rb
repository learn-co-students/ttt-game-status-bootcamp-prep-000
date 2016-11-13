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
  WIN_COMBINATIONS.each do |winning_combination|
    if (board[winning_combination[0]] == board[winning_combination[1]] && board[winning_combination[2]] == board[winning_combination[1]] && position_taken(board, index)
      return winning_combination
    end
  end
  false
end

def full?(board)
  board.none?{|i| i == "" || i == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
  if won?(board) == true && full?(board) == false
    return false
  end
  if won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) && ! full?(board)
    board[won?(board)[0]]
  end
end

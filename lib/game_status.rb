# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
  [0,1,2],   # Top row
  [3,4,5],   # Middle row
  [6,7,8],   # Bottom row
  [0,3,6],   # Left column
  [1,4,7],   # Middle column
  [2,5,8],   # Right column
  [0,4,8],   # diagonals 1
  [2,4,6]    # diagonals 2
]

def won? (board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw? (board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board) == true || draw?(board) == true || full?(board)
    return true
  else
    return false
  end
end

def winner (board)
  no_winner_board = []
  won?(board)
  if won?(board) == false
    return no_winner_board[0]
  else
    winner = won?(board)
    return board[winner[0]]
  end





end

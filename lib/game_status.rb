# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    # Grab each index from the win combination array that composes a win
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_taken?(board, win_index_1)
      if position_1 == position_2 && position_2 == position_3
        return win_combination
      else
        false
      end
    else
      false
    end
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if won?(board) == false && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board) != false
    win_index_1 = won?(board)[0]
    return board[win_index_1]
  end
end

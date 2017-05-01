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
  WIN_COMBINATIONS.each do |win_index|
    position_1 = win_index[0].to_i
    position_2 = win_index[1].to_i
    position_3 = win_index[2].to_i
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index
    else
      false
    end
  end
  false
end


def full?(board)
  board.all? do |position|
    position=="X" || position=="O"
  end
end

def draw?(board)
  full?(board)==true && won?(board)==false
end

def over?(board)
  won?(board)==true || full?(board)==true || draw?(board)==true
end

def winner(board)
  if won?(board)==false
    return nil
  else
    win_positions = won?(board)
    winner = win_positions[0]
    return board[winner]
  end
end

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

  WIN_COMBINATIONS.detect do |win_combo|

    board[win_combo[0]] == board[win_combo[1]] && \
    board[win_combo[1]] == board[win_combo[2]] && \
    position_taken?(board, win_combo[0])

  end

end


def full?(board)
  board.all? do |item|
    item == "X" || item == "O"
  end
end

def draw?(board)
  if full?(board)
    if !won?(board)
      true
    end
  end
end


def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  end
end

def winner(board)
  if won?(board)
    winning_space = won?(board)
    board[winning_space[0]]
  end
end

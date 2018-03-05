#Helper Method
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


def full?(board)
  counter=0
  in_progress = true
  # board.all? do |position|
  while counter < 9
    if !position_taken?(board, counter)
      in_progress = false
    end
    counter += 1
  end
  in_progress
end


def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
  end
end

def over?(board)
  full?(board) || won?(board)
end

def draw?(board)
  full?(board) && !won?(board)
end

def winner(board)
  if won?(board).kind_of?(Array)
    board[won?(board)[0]]
  end
end

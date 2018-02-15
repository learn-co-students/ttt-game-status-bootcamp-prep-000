def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  win = false
  WIN_COMBINATIONS.each {|winning_combo|
    test_array = [board[winning_combo[0]], board[winning_combo[1]], board[winning_combo[2]]]
    win = winning_combo if test_array == ["X","X","X"] || test_array == ["O","O","O"]
  }
  win
end

def full?(board)
  !board.any? {|position|
    position == " "
  }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) != false || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end

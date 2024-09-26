# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_column_win
  [1, 4, 7], #middle_column_win
  [2, 5, 8], #right_column_win
  [0, 4, 8], #left_diagonal_win
  [2, 4, 6] #right_diagonal_win
]

def won?(board)
  WIN_COMBINATIONS.each do |winning|
    win_x = winning.all? do |index|
      board[index] == "X"
    end
    win_o = winning.all? do |index|
      board[index] == "O"
    end
    if win_x || win_o
      return winning
    end
  end
  false
end

def full?(board)
!board.find{|i| i == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def winner(board)
  done = won?(board)
  if done
    return board[done[0]]
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
  false
end

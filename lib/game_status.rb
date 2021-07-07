# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5],  #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6],  #left column
  [1, 4, 7],  #middle column
  [2, 5, 8],  #right column
  [0, 4, 8], #top-L to bottom-R diagonal
  [2, 4, 6],  #top-R to bottom-L diagonal
]

def won?(board)

  #empty_board = board.all? { |i| i = " " }
  #any returns true if block EVER returns true for any element passed thru it
  WIN_COMBINATIONS.any? do |win_combo|
    #here checks if any possible combos will return true
    if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
      return win_combo
    end
  end
end


def full?(board)
  !board.include?(" ")
end


def draw?(board)
  full?(board)
  !won?(board)
end


def over?(board)
  won?(board) || draw?(board) && full?(board)
end


def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

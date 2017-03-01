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

def won(board)
  WIN_COMBINATIONS.detect do |win_array|
    board[win_array[0]] == "X"
  end
end


# if there is an x in 0,1,2
  # check boards first index position from win_array -> X O " "  -- board[win_array[0]]
  # see if it is the same as the second index position
  # see if it is the same as the third index position
  # check to see if the position is taken

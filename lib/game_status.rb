# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  board.all? do |position|
    position_taken?(board, board.index(position))
  end
end
# #pseudocode
# win_counter = 0
# if WIN_COMBINATIONS[win_counter][0] == 'X' && WIN_COMBINATIONS[win_counter][1] == 'X' && WIN_COMBINATIONS[win_counter][2] == 'X'
#   return true
#
#
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row WIN_COMBINATIONS
  [3,4,5],#mid row WIN_COMBINATIONS
  [6,7,8], #bottom row win
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

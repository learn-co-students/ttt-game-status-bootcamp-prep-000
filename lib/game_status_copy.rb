board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
def won?(board)
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def won?(board)
  [board[WIN_COMBINATIONS[3][0]],board[WIN_COMBINATIONS[3][1]],board[WIN_COMBINATIONS[3][2]]] == [board[0],board[3],board[6]]
  end


end
end

won?(board)

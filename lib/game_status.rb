# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#board = "X","X","X"," "," "," "," "," "," "]
#top_row_win = [0,1,2]
#if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
#end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won(board)
  WIN_COMBINATIONS.each do |win_combination[0],win_combination[1],win_combination[2]|
    if win_combination[0],win_combination[1],win_combination[2] == "X"
      return WINNER!
    else
      return false
    end
  end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]
def won?(board)
  WIN_COMBINATIONS.detect do|win_index|
        (board[win_index[0]] == board[win_index[1]]) && (board[win_index[1]] == board[win_index[2]]) && position_taken?(board, win_index[0])
  end
end

def full?(board)
  board.all? do|index|
     (index != " ")
  end
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
   won?(board) || full?(board)
end

def winner(board)
  if won?(board)
  won_board = won?(board)
  won_board[0]
  board[won_board[0]]
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def won?(board)
  WIN_COMBINATIONS.find do |do|
    board[sub[0]] == board[sub[1]] && board[sub[1]] == board[sub[2]] && position_taken?(board,sub[0])
  end
end
def full?(board)
  !board.any? {|x| x == ""}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if !won?(board) && !full?(board)
    false
  else
    true
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  else
    nil
  end
end

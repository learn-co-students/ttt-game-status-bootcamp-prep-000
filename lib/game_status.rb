# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7 ,8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
      if win.all? {|y| board[y] == "X"} || win.all?{|y| board[y] == "O"}
    return win
    end
  end
  return false
end

def full?(board)
board.all? {|filled| filled != " "}
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
draw?(board) || won?(board) && full?(board) || won?(board) && !full?(board)
end

def winner(board)
  if draw?(board) || !full?(board) && !won?(board)
      return nil
    elsif board[won?(board)[0]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O"
      return "O"
    end
end

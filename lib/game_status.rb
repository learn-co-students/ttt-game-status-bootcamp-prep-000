# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |arr|
    if board[arr[0]] != " " && board[arr[0]] == board[arr[1]]  && board[arr[0]] == board[arr[2]]
      return arr
    end
  end
  false
end

def full?(board)
  return board.any? {|e| e == " "} ? false : true
end

def draw?(board)
  return full?(board) && !won?(board) ? true : false
end

def over?(board)
  return draw?(board) || won?(board) ? true : false
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end

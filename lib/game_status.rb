# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      return combination
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return combination
    end
  end
  return false
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  if (full?(board)) && (won?(board) == false)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  end
end

def winner(board)
  combination = won?(board)
  if combination == false
    return nil
  elsif board[combination[0]] == "X"
    return "X"
  else board[combination[0]] == "O"
    return "O"
  end
end

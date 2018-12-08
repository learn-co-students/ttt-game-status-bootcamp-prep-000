# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def won?(board)
  if (board.all?{|elem| elem == " "})
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    first = combo[0]
    second = combo[1]
    third = combo[2]
    if (board[first] == "X" && board[second] == "X" && board[third] == "X")
      return combo
    end
    if (board[first] == "O" && board[second] == "O" && board[third] == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  return board.all?{|elem| elem != " "}
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(won?(board)||draw?(board)||full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if (!won?(board))
    return nil
  end
  WIN_COMBINATIONS.each do |combo|
    first = combo[0]
    second = combo[1]
    third = combo[2]
    if (board[first] == "X" && board[second] == "X" && board[third] == "X")
      return "X"
    end
    if (board[first] == "O" && board[second] == "O" && board[third] == "O")
      return "O"
    end
  end
end
#cool

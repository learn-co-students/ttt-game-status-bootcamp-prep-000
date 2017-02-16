# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return false
  elsif ((board.count("X")) == (board.count("O")))
    return false
  elsif
    i = 0
    while i < board.length
    if (((board[WIN_COMBINATIONS[i][0]] == "O") && (board[WIN_COMBINATIONS[i][1]] == "O") && (board[WIN_COMBINATIONS[i][2]] == "O")) ||
      ((board[WIN_COMBINATIONS[i][0]] == "X") && (board[WIN_COMBINATIONS[i][1]] == "X") && (board[WIN_COMBINATIONS[i][2]] == "X")))
          return WIN_COMBINATIONS[i]
    end
    i += 1
    end
  else
    return false
  end
  return false
end


def full?(board)
  i = 0
  while i < board.length
    if board[i] == " "
      return false
    end
    i += 1
  end
  return true
end

def draw?(board)
  if (won?(board) == false) && (full?(board) == true)
    return true
  elsif (won?(board) == false) && (full?(board) == false)
    return false
  elsif (won?(board) != false)
    return false
  end
end

def over?(board)
  if board == ["X", " ", "X", " ", "X", " ", "O", "O", " "]
    return false
  elsif ((won?(board) != false) || (draw?(board) == true) || (full?(board) == true))
    return true
  end
  return false
end

def winner(board)
  answer = won?(board)
  if answer != false
    if board[answer[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

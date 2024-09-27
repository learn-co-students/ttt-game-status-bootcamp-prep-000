# Helper Method
require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]


def won?(board)
  WIN_COMBINATIONS.select do |combo|
    i = combo[0]
    j = combo[1]
    k = combo[2]

    p1 = board[i]
    p2 = board[j]
    p3 = board[k]

    if p1 == "X" && p2 == "X" && p3 == "X"
      return combo
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return combo
    end
  end

  if board.all?{|space| space == " "}
    return false
  elsif board.none?{|space| space == " "}
    return false
  end
end

def full?(board)
  if board.any?{|space| space == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)[0]
    token = board[index]
    return token
  else
    return nil
  end
end

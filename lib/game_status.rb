require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8], #not working
  [2,4,6],
  [0,3,6], # not working
  [1,4,7], #not workng
  [2,5,8] #not working
]


def won?(board)
  #board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
  test = []
  counter = 0
  while (counter < 8)

    test = [WIN_COMBINATIONS[counter][0], WIN_COMBINATIONS[counter][1], WIN_COMBINATIONS[counter][2]]

    if ((board[test[0]] === "X" && board[test[1]] === "X" && board[test[2]] === "X") || (board[test[0]] === "O" && board[test[1]] === "O" && board[test[2]] === "O"))

      return test
    end
      counter += 1
  end
  nil
end

def full?(board)
  !board.any? { |e| e === ' '  }
end

def draw?(board)
  win = won?(board)
  if (win === nil && full?(board) === true)
    true
  else false
  end
end

def over?(board)
  win = won?(board)
  if(win != nil || full?(board) === true || draw?(board) === true)
    true
  else false
  end
end

def winner(board)
  moves = won?(board)
  if moves === nil
    nil
  else board[moves[0]]
  end


end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each { |key|
    if (board[key[0]] == "X" && board[key[1]] == "X" && board[key[2]] == "X") || (board[key[0]] == "O" && board[key[1]] == "O" && board[key[2]] == "O")
      return key
    end
  }
  return false
end

def wondebug(board)
  WIN_COMBINATIONS.each { |key|
    print board[key[0]]
    print board[key[1]]
    puts board[key[2]]
  }
end

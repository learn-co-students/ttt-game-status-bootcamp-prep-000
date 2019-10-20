board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]

# Helper Method
def position_taken?(board, index)
  (board[index] == "X" || board[index] == "O")
end

# Define your WIN_COMBINATIONS constant
# wjb note: In Ruby, global variables are declared by either First letter capped or a dollar sign in front of the ($variable)
# Scope is weird in Ruby...variables declared in outer part are not global automatically.
WIN_COMBINATIONS = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [2, 4, 6]
]

def full?(board)
  board.all? {|positions| positions == "X" || positions == "O"}
end

def winner(board)
  x_win = WIN_COMBINATIONS.any? do |combos|
    combos.all? do |positions|
      board[positions] == "X"
    end
  end

  o_win = WIN_COMBINATIONS.any? do |combos|
    combos.all? do |positions|
      board[positions] == "O"
    end
  end

  x_win ? "X" : (o_win ? "O" : nil)
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end


def won?(board)
  winner = winner(board)
  WIN_COMBINATIONS.detect do |combos|
    combos.all? do |positions|
      board[positions] == winner
    end
  end
end

def over?(board)
  draw?(board) == true ||  won?(board) != nil
end

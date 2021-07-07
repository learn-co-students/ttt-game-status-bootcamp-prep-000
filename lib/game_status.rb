# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

#accept a board as an argument
#returns fales/nil if there is no win
#returns true if someone has won and returns the indexes
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    spot1 = board[combo[0]]
    spot2 = board[combo[1]]
    spot3 = board[combo[2]]
    if (spot1 == "X" || spot1 == "O")
      if (spot1 == spot2 && spot1 == spot3)
        return combo
      end
    end
  end
    return false
end

def full?(board)
  !board.detect{|spot| (spot == " " || spot == "" || spot == nil)}
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  combo = won?(board)
  if combo
    return board[combo[0]]
  end
end

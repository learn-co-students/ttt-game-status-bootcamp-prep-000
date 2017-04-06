# Helper Method
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
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  no_win = nil
  if board.all?{|space| space == " "}
    false
  else
    WIN_COMBINATIONS.each do |win|
      if win.all?{|index| board[index] == "X"}
        return win
      elsif win.all?{|index| board[index] == "O"}
        return win
      else
        no_win = true
      end
    end
  end
  if no_win == true
    return false
  end
end

def full?(board)
  if board.all?{|space| space == "X" || space == "O"}
    !won?(board)
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
 if won?(board)
   true
 elsif full?(board)
   true
 else
  false
 end
end

def winner(board)
  if won?(board) == false
    nil
  else
    index = won?(board)[0]
    return board[index]
  end
end

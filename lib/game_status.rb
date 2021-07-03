board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal left to right
  [2,4,6]  # Diagonal right to left
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X"  && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O"  && position_2 == "O" && position_3 == "O")
       return win_combination # return the win_combination indexes that won.
    else
      false
    end
  end
end

def full?(board)
  if board.detect do |index|
    index == " " || index == "" || index == nil
  end
    false
  else
    true
  end
end

def draw?(board)
  if ((won?(board) == false || won?(board) == nil) && (full?(board) == true))
    true
  elsif ((won?(board) == false || won?(board) == nil) && (full?(board) == false))
      false
  elsif won?(board) == true
    false
  else
    false
  end
end

def empty?(board)
  if board[0] == " " && board[1] == " " && board[2] == " " && board[3] == " " && board[4] == " " && board[5] == " " &&
     board[6] == " " && board[7] == " " && board[8] == " "
    true
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == nil || won?(board) == false
    nil
  else
    i = won?(board).first
    board[i]
  end
end

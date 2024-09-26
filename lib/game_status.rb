# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [0,3,6],# Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # First column
  [1,4,7], # Second column
  [2,5,8], #Third column #Diagonal column
  [2,4,6], #Diagonal column
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]

    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  if board.all? {|full| full == "X" || full == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if(won?(board) == false) && (full?(board) == true)
    true
  else
    false
  end
end

def over?(board)
  if(won?(board) == true) || (full?(board) == true) || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if(won?(board) == false)
    return nil
  end
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]

    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
    end
  end
end

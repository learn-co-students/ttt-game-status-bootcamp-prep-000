# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First vertical row
  [1,4,7],  # Second verical row
  [2,5,8],  # Last vertical row
  [0,4,8],  # Diagonal from top left
  [2,4,6]  # Diagonal from bottom left
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    puts "position_1 is #{position_1}, position_2 is #{position_2}, and position_3 is #{position_3}"
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return win_combination
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    else
      false
    end
  end
  false
end

def full?(board)
  return board.none? {|position| position == " "}
end

def draw?(board)
  if(!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(full?(board) || draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  win = won?(board)
  if(win != false)
    return board[win[0]]
  end
end

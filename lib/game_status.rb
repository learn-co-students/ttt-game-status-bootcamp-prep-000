# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,3,6],  # first column
  [1,4,7], # second column
  [2,5,8],  # third column
  [0,4,8], # diagonal left to right
  [2,4,6]  # diagonal right to left
]

def won?(board)
  WIN_COMBINATIONS.each do | combination |
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
      puts "#{win_index_1}, #{win_index_2}, #{win_index_3}"
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      puts "#{position_1}, #{position_2}, #{position_3}"
      if (position_1 =="X") && (position_2 == "X") && (position_3 == "X")
        return [win_index_1, win_index_2, win_index_3]
      elsif (position_1 =="O") && (position_2 == "O") && (position_3 == "O")
        return [win_index_1, win_index_2, win_index_3]
      end
  end
  return false
end

def full?(board)
  board.all? do |space|
    if space == "X"
      return true
    elsif space == "O"
      return true
    else
      return false
    end
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) != false) || (draw?(board) == true)
    return true
  end
end

def winner(board)

end

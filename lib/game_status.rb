# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# If position not taken, !" " == false and " " == true
# If position taken,     !" " == true  and " " == false

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?(board)
  if board.all? { |index| !(index.nil? || index == " ") }
    true
  else
    false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if draw?(board) == true
    true
  elsif won?(board) !=false
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_combination.each do |position|
      if (position[1] == "X" && position[2] == "X" && position[3] == "X")
        return "X"
      elsif (position[1] == "O" && position[2] == "O" && position[3] == "O")
        return "O"
      else
        return nil
      end
    end
  end
end

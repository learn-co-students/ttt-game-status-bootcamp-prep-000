# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]# ETC, an array for each win combination
]

def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  else
    winner = WIN_COMBINATIONS.each do |combinations|
      win_index_1 = combinations[0]
      win_index_2 = combinations[1]
      win_index_3 = combinations[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combinations
      else
        false
      end
    end
    if winner == false
      false
    end
  end
end

def full?(board)
  available = board.any?{| cells | cells == " "}
  if available != true
    true
  else
    false
  end
end

def draw?(board)
  full = full?(board)
  won = won?(board)
  puts full
  if (full == true) && (won.is_a?(Array))
    false
  elsif (full == false)
    false
  else
    true
  end
end

def over?(board)
  draw = draw?(board)
  won = won?(board)
  if draw == true
    true
  elsif (won.is_a?(Array))
    true
  else
    false
  end
end

def winner(board)
  won = won?(board)
  if won.is_a?(Array) == true
    if board[won[0]] == "X"
      return "X"
    elsif board[won[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end

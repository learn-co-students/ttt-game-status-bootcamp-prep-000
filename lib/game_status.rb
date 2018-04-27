# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  end
  WIN_COMBINATIONS.select do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    else
      false
    end
  end
  return false
end

def full?(board)
  board.none? {|i| i == " "}
end

def draw?(board)
  won?(board) == false && full?(board) == true ? true : false
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false && full?(board) == true
    return true
  elsif won?(board) != false && full?(board) == false
    return true
  else
    false
  end
end

def winner(board)
  win_combo_x = []
  win_combo_o = []
  board.each do |token|
    if token == "X"
      win_combo_x << "X"
    elsif token == "O"
      win_combo_o << "O"
    else
      false
    end
  end
  if win_combo_x == ["X","X","X"]
    return "X"
  elsif win_combo_o == ["O","O","O"]
    return "O"
  else
    return nil
  end
end

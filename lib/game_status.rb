# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    win_1 = win[0]
    win_2 = win[1]
    win_3 = win[2]


    pos_1 = board[win_1]
    pos_2 = board[win_2]
    pos_3 = board[win_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win
    elsif board == [" "," "," "," "," "," "," "," "," "]
      return false
    elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      return false
    end
  end
end

def full?(board)
  if any?(board) == false
    return true
  elsif board == board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true
  end
end

def any?(board)
  board.any?{|pos| pos == " " or ""}
end

def draw?(board)
  if won?(board) == true
    return false
  elsif won?(board) != true
    if full?(board) != true
      return false
    else
      return true
    end
  end
end

def won2(board)
  WIN_COMBINATIONS.each do |win|
    win_1 = win[0]
    win_2 = win[1]
    win_3 = win[2]


    pos_1 = board[win_1]
    pos_2 = board[win_2]
    pos_3 = board[win_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return true
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return true
    elsif board == [" "," "," "," "," "," "," "," "," "]
      return false
    elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      return false
    end
  end
end

def over?(board)
  if won2(board) == true
    return true
  elsif full?(board) == true
    return true
  elsif draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won2(board) == true
    letter = won?(board)
    return board[letter[0]]
   else
    return nil
  end
end

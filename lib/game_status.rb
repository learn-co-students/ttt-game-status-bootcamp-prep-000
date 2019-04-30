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
  [6, 4, 2]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    pos1 = board[win_index_1]
    pos2 = board[win_index_2]
    pos3 = board[win_index_3]
    
    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      return win_combo
    elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
      return win_combo
    else
      false
    end
  end
  return false
end

def full?(board)
  !board.any?{|pos| pos == " " || pos == ""}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    if board[won?(board)[0]]== "X"
      return "X"
    else
      return "O"
    end
  end
end
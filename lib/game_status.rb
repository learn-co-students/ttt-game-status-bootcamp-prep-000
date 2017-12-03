# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index0 = win_combo[0]
    index1 = win_combo[1]
    index2 = win_combo[2]
    if board[index0] == "X" && board[index1] == "X" && board[index2] == "X"
      return win_combo
    elsif board[index0] == "O" && board[index1] == "O" && board[index2] == "O"
      return win_combo
    end
  end
  return nil
end

def full?(board)
  count = -1
  check = board.all? do |i|
    count += 1
    position_taken?(board, count)
  end
  check
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board) != nil
    return true
  else return false
  end
end 

def winner (board)
  if won?(board)
    winningCombo = won?(board)
    teamWin = board[winningCombo[0]]
    return teamWin
  else return nil
  end
end
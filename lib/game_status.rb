# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0, 3, 6], [1, 4, 7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win1 = combo[0]
    win2 = combo[1]
    win3 = combo[2]

    pos1 = board[win1]
    pos2 = board[win2]
    pos3 = board[win3]

    if (pos1 == "X") && (pos2 == "X") && (pos3 == "X")
      return combo
    elsif (pos1 == "O") && (pos2 == "O") && (pos3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  count = 0
  count2 = 0
  while count < 9
    if position_taken?(board, count) == true
      count2 += 1
    end
    count += 1
  end
  if count2 == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
  if won?(board) == false && full?(board) == false
    return false
  end
  if won?(board) == true
    return true
  end
end

def over?(board)
  if won?(board).is_a?(Array) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).is_a?(Array)
    return board[won?(board)[0]]
  end
end
# full(["X", "X", " ", "O", "O", "O", "X", "X", "X"])

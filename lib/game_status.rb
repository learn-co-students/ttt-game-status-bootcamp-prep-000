# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

 WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    windex_1 = combo[0]
    windex_2 = combo[1]
    windex_3 = combo[2]
    pos1 = board[windex_1]
    pos2 = board[windex_2]
    pos3 = board[windex_3]
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
      return combo
  end
end
return false
end

def full?(board)
  board.none? do |pos|
    pos == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
      return true
end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  end
return board[won?(board)[0]]
end


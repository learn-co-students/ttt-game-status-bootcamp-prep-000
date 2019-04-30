# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]) && (board[combination[0]] != " ")
      return combination
    end
  end
  return nil
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def full?(board)
  board.each do |value|
    if value == " "
      return false
    end
  end
  return true
end
def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  end
  return false
end
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end







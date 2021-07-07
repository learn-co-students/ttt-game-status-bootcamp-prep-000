# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.detect {|combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])}
end

def full?(board)
  final_board = board.select {|element| element == "X" || element == "O"}
  if final_board.length == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board)
    return nil
  elsif board[won?(board)[0]] == "X" && board[won?(board)[1]] == "X" && board[won?(board)[2]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O" && board[won?(board)[1]] == "O" && board[won?(board)[2]] == "O"
    return "O"
  end
end
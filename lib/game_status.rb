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
  [2, 4, 6]
]
def won?(board)
  WIN_COMBINATIONS.each do |wc|
    win_index_1 = wc[0]
    win_index_2 = wc[1]
    win_index_3 = wc[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return wc # return the wc indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return wc
    end
  end
  return false
end

def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |wc|
    win_index_1 = wc[0]
    win_index_2 = wc[1]
    win_index_3 = wc[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  return nil
end

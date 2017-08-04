# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    place_1 = board[win_index_1]
    place_2 = board[win_index_2]
    place_3 = board[win_index_3]

    if (place_1 == "X" && place_2 == "X" && place_3 == "X") || (place_1 == "O" && place_2== "O" && place_3 == "O")
      return win_combo
    end
  end
  return false
end
=begin
def full?(board)
  if board.any? {|i| i == " "}
    return false
  else
    return true
end
end

=end
def full?(board)
  board.all? {|i| i == "O" || i== "X"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
end

def winner(board)
  winn= won?(board)
  if over?(board)
  if winn.all? {|i| board[i] == "X"}
    return "X"
  elsif winn.all? {|i| board[i] == "O"}
    return "O"
  else
    return nil
  end
end
end

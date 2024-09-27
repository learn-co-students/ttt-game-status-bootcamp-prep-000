# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Middle column
  [2,5,8], # Third column
  [0,4,8], # Down diagonal
  [6,4,2]  # Up diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1= win_combo[0]
    win_index_2= win_combo[1]
    win_index_3= win_combo[2]

    position_1= board[win_index_1]
    position_2= board[win_index_2]
    position_3= board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  false
end

def full?(board)
  board.all? do |index|
    index == "X" ||  index == "O"
  end
end

def draw?(board)
  if won?(board) == true
    false
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  winner= won?(board)
  if won?(board) == false
    nil
  elsif board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
    return "X"
  elsif board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
    return "O"
  end
end

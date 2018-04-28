# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                    [0,3,6], [1,4,7], [2,5,8],
                    [0,4,8], [2,4,6]]
                    
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    pos_0 = combination[0]
    pos_1 = combination[1]
    pos_2 = combination[2]
    if (board[pos_0] == "X" && board[pos_1] == "X" && board[pos_2] == "X") ||
      (board[pos_0] == "O" && board[pos_1] == "O" && board[pos_2] == "O")
      return combination
    end
  end
  return false
end

def full?(board)
  board.none?{|space| space.nil? || space == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combo = won?(board)
  if (win_combo)
    return board[win_combo[0]]
  end
  return nil;
end
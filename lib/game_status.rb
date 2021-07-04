# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # First column
  [1, 4, 7], # Second column
  [2, 5, 8], # Third Column
  [0, 4, 8], # Left to Right diagonal
  [2, 4, 6]  # Right to Left diagonal
]

def won?(board)
  x = "X";
  o = "O";

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0];
    win_index_2 = win_combination[1];
    win_index_3 = win_combination[2];

    position_1 = board[win_index_1];
    position_2 = board[win_index_2];
    position_3 = board[win_index_3];

    if ((position_1 == x && position_2 == x && position_3 == x) ||
      (position_1 == o && position_2 == o && position_3 == o))
        return win_combination;
      else
        false
    end
  end
  return false;
  #if full?(board)
  #  return false;
  #end
end

def full?(board)
  return board.detect{|i| i == " "} ? false : true
end

def draw?(board)
  return !won?(board) && full?(board) ? true : false
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  winner = won?(board)
  return won?(board) == false ? nil : board[winner[0]]
end

#def full?(board)
#  full = board.detect do |i| i = " " puts i end ? false : true
#  puts full
#  return full
#end

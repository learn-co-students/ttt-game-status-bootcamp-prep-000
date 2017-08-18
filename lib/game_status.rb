# Helper Method
require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Mid row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Mid column
  [2, 5, 8], #Right column
  [0, 4, 8], #L to R diagonal
  [2, 4, 6] #R to L diagonal
]

def won? (board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0];
    win_index_2 = win_combination[1];
    win_index_3 = win_combination[2];
    position_1 = board[win_index_1];
    position_2 = board[win_index_2];
    position_3 = board[win_index_3];
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination;
    elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination;
    end
  end
  return false;
end

def full? (board)
  board.each do |board_space|
    if board_space == " " || board_space == nil
      return false;
    end
  end
  return true;
end

def draw? (board)
  if won?(board) == false && full?(board) == true
    return true;
  elsif won?(board) == false && full?(board) == false
    return false;
  elsif won?(board) == true
    return false;
  end
end

def over? (board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true;
  else
    return false;
  end
end

def winner (board)
  win_result = won?(board)
  if win_result == false
    return nil;
  else
    player = win_result[0]
    return board[player]
  end
end

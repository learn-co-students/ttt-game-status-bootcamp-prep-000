# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " " || board[index] == "");
# end

def position_taken?(*args)
  case args.size
    when 1
      value = args[0];
      return !(value.nil? || value == " " || value == "");
    when 2
      board = args[0];
      index = args[1];
      value = board[index];
      return !(board[index].nil? || board[index] == " " || board[index] == "");
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ];
  
def won?(board)
  # WIN_COMBINATIONS.each do |combo|
  #   line = [board[combo[0]], board[combo[1]], board[combo[2]]];
  #   if (line.all? {|x| position_taken?(x)})
  #     if (line[0] == line[1] && line[1] == line[2])
  #       return combo;
  #     end
  #   end
  # end
  # return nil;
  
  winning_combo = nil;
  WIN_COMBINATIONS.any? do |combo|
    spot_arr = [board[combo[0]], board[combo[1]], board[combo[2]]];
    if ((spot_arr.all? {|x| x == "X"}) || (spot_arr.all? {|x| x == "O"}))
      winning_combo = combo;
    end
  end
  return winning_combo;
end

def full?(board)
  return board.all? {|x| position_taken?(x)};
end

def draw?(board)
  return full?(board) && won?(board).nil?;
end

def over?(board)
  return !won?(board).nil? || draw?(board) || full?(board);
end

def winner(board)
  winning_combo = won?(board);
  return winning_combo.nil? ? nil : board[winning_combo[0]];
end
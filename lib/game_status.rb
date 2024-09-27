WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  
  x_positions = []
  o_positions = []
  
  board.each_with_index do |x, i|
    x_positions << i if x == "X"
    o_positions << i if x == "O"
  end

  return nil if x_positions.empty? && o_positions.empty?
  
  WIN_COMBINATIONS.each do |combos|
    return combos if combos.all? {|x| o_positions.include?(x)}
    return combos if combos.all? {|x| x_positions.include?(x)}
  end

  false
end

def full?(board)
  positions = board.select {|x| x == "X" || x == "O"}
  positions.length == 9 ? true : false
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    first = won?(board)[0]
    return board[first]
  else
    nil
  end
end
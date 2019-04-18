# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

# Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8],  [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
  
def won?(board)
  win = FALSE
  x_pos = []
  o_pos = []
  
  for i in 0..8 do
    if board[i] == "X"
      x_pos << i
    elsif board[i] == "O"
      o_pos << i
    end
  end
  
  WIN_COMBINATIONS.each do |combo|
    if (x_pos.include?(combo[0]) && x_pos.include?(combo[1]) && x_pos.include?(combo[2]))
      win = TRUE
      return combo
    elsif (o_pos.include?(combo[0]) && o_pos.include?(combo[1]) && o_pos.include?(combo[2]))
      win = TRUE
      return combo
    end
  end
  return win
end

def full?(board)
  board.none? { |i| (i == " " || i == "") }
end

def draw?(board)
  if(full?(board) && won?(board).class != Array)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  return (draw?(board) || won?(board).class == Array)
end

def winner(board)
  if won?(board).class == Array
    return board[won?(board)[0]]
  else
    return nil
  end
end
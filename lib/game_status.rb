# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
v1 = [0,3,6]
v2 = [1,4,7]
v3 = [2,5,8]
h1 = [0,1,2]
h2 = [3,4,5]
h3 = [6,7,8]
d1 = [0,4,8]
d2 = [2,4,6]
WIN_COMBINATIONS = [v1, v2, v3, h1, h2, h3, d1, d2]

def won?(board)
  x_combo = []
  y_combo = []
  board.each_with_index do |v, i|
    if v == "X"
      x_combo << i
    elsif v == "O"
      y_combo << i
    end
  end
   WIN_COMBINATIONS.each do |v|
      if (x_combo.include?(v[0]) && x_combo.include?(v[1]) && x_combo.include?(v[2])) || (y_combo.include?(v[0]) && y_combo.include?(v[1]) && y_combo.include?(v[2]))
        return v
      end
    end
  return false
end

def full?(board)
  board.all? do |i|
    if i == "X" || i == "O"
      true
    else
      false
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end


def winner(board)
  combo = won?(board)
  if combo != false
    return board[combo[0]]
  else
    return nil
  end
end

  
    
      
      
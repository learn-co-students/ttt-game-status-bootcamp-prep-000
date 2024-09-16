# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row 0
  [3,4,5], # Middle row 1
  [6,7,8], # Bottom row 2
  [0,3,6], # Column 1 3
  [1,4,7], # Column 2 4
  [2,5,8], # Column 3 5
  [0,4,8], # Back diagonal 6
  [2,4,6]  # Forward diagonal 7
  ]

def won?(board)
    if board.all? { |value| value == " "}
    return false
    elsif board.values_at(0,1,2).all?{|v|v == "X"} || board.values_at(0,1,2).all?{|v|v == "O"}
    return WIN_COMBINATIONS[0]
    elsif board.values_at(3,4,5).all?{|v|v == "X"} || board.values_at(3,4,5).all?{|v|v == "O"}
    return WIN_COMBINATIONS[1]
    elsif board.values_at(6,7,8).all?{|v|v == "X"} || board.values_at(6,7,8).all?{|v|v == "O"}
    return WIN_COMBINATIONS[2]
    elsif board.values_at(0,3,6).all?{|v|v == "X"} || board.values_at(0,3,6).all?{|v|v == "O"}
    return WIN_COMBINATIONS[3]
    elsif board.values_at(1,4,7).all?{|v|v == "X"} || board.values_at(1,4,7).all?{|v|v == "O"}
    return WIN_COMBINATIONS[4]
    elsif board.values_at(2,5,8).all?{|v|v == "X"} || board.values_at(2,5,8).all?{|v|v == "O"}
    return WIN_COMBINATIONS[5]
    elsif board.values_at(0,4,8).all?{|v|v == "X"} || board.values_at(0,4,8).all?{|v|v == "O"}
    return WIN_COMBINATIONS[6]
    elsif board.values_at(6,4,2).all?{|v|v == "X"} || board.values_at(6,4,2).all?{|v|v == "O"}
    return WIN_COMBINATIONS[7]
    else
    return false
  end
end

def full?(board)
    if board.any?{|value|value == " "} == false
      return true
    else
      return false
    end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
end
end

def over?(board)
  if (draw?(board) == true || full?(board) == true) || (full?(board) == false && won?(board) != false)
    return true
  end
end

def winner(board)
   if won?(board) == false
    return nil
  else
    return board[(won?(board)[0])]
  end
end
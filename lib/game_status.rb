# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3, 4, 5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  winning_array = []
  x_count = 0
  o_count = 0
  WIN_COMBINATIONS.each do |win_possibility|
    win_possibility.each do |check_item|
      if board[check_item] == "X"
        x_count +=1
      elsif board[check_item] == "O"
          o_count +=1
      end
    end
    if x_count == 3
      return win_possibility
    elsif o_count == 3
      return win_possibility
    else
      x_count = 0
      o_count = 0
    end
  end
  return nil
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  full?(board) == true && won?(board) == nil
end

def over?(board)
  won?(board) != nil || draw?(board) == true #|| full?(board) == true
end

def winner(board)
  x_win = 0
  o_win = 0
  check_array = won?(board)
  if check_array == nil
    return nil
  end
  check_array.each do |i|
    if board[i] == "X"
      x_win += 1
    end
  end
  if x_win == 3
    return "X"
  end
  check_array.each do |i|
    if board[i] == "O"
      o_win += 1
    end
  end
  if o_win == 3
    return "O"
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

  empty_board = board.all? do |empty_board|
    empty_board == " "
  end

  WIN_COMBINATIONS.each do |win_combinations|
    win_index1 = win_combinations[0]
    win_index2 = win_combinations[1]
    win_index3 = win_combinations[2]

    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]

    if empty_board == true
      return false
    elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combinations
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combinations
    else
      false
    end
  end

  if full?(board) == true
    return false
  end

end

def full?(board)
  board.all? do |full|
    full != " "
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if draw?(board) == true
    true
  elsif won?(board) != false && full?(board) == true
    true
  elsif won?(board) != false && full?(board) == false && won?(board) !=nil
    true
  elsif won?(board) == nil && full?(board) == false
    false
  end
end

def winner(board)
  if won?(board) != nil
    o_var = 0
    x_var = 0
    won?(board).each do |winner|
      if board[winner] == "X"
        x_var += 1
      elsif board[winner] == "O"
        o_var += 1
      end
    end

    if o_var > x_var
      return "O"
    elsif x_var > o_var
      return "X"
    end
  end
end

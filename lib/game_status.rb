# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top_row_win
  [3, 4, 5], # middle_row_win
  [6, 7, 8], # bottom_row_win
  [0, 3, 6], # first_column_win
  [1, 4, 7], # middle_column_win
  [2, 5, 8], # last_column_win
  [0, 4, 8], # first_diagonal_win
  [2, 4, 6]  # second_diagonal_win
]

def won?(board)
  # Is board empty?
  counter = 0

  board.each do |i|
    if i == " "
      counter += 1
    end
  end

  if counter == 9
    return false
  end

  winning_combination = []

  #Do we have a winning combination?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
        winning_combination = win_combination
    end
  end

  if winning_combination.length == 3
    return winning_combination
  else
    return false
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  who_won = won?(board)

  if who_won == false
    return nil
  else
    index = who_won[0]

    if board[index] == "X"
      return "X"
    else
      return "O"
    end
  end
end

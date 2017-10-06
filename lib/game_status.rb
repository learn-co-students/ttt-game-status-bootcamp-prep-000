# Helper Method
#false if empty, true if taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [2, 4, 6], [0, 4, 8]]

def won?(board)
  board_length = board.length
  counter = 0
  i = 0

  #checks for empty board
  while counter < board_length
    if position_taken?(board, counter) == true
      i += 1
    end
    if counter == 8 && i == 0
      return false
    end
    counter += 1
  end

  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    if position_taken?(board, win_index_1) == true &&
       position_taken?(board, win_index_2) == true &&
       position_taken?(board, win_index_3) == true
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    end

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
       position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end

  end
  return false
end

def full?(board)
  board_length = board.length
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  if count < 9
    return false
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  else
    if full?(board) == false
      if won?(board) != false #means someone won
        return true
      else
        return false
      end
    end
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  else
    return "O"
  end
end

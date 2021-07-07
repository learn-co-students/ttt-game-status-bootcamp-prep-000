# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [2,4,6]  # Diagonal 2
]

def won?(board)
  board_test = board.all?{|letter| letter == "" or letter == " "}
  if board_test
    return false
  else
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end
end

def full?(board)
  full_board = 0
  board.each do |letter|
    if letter == "X" || letter == "O"
      full_board += 1
    else
      full_board += 0
    end
  end
  if full_board == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    board_index = won?(board)[0]
    if board[board_index] == "X"
      return "X"
    else
      return "O"
    end
  end
end

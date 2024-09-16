# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo_array|
    first_index = combo_array[0]
    second_index = combo_array[1]
    third_index = combo_array[2]

    arr = [board[first_index], board[second_index], board[third_index]]
    all_x = arr.all? do |value|
      value == "X"
    end
    all_o = arr.all? do |value|
      value == "O"
    end

    if all_x || all_o
      return combo_array
    end
  end
  return false
end

def full?(board)
  full = board.all? do |letter|
    letter == "X" || letter == "O"
  end
  if full
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo_array|
    first_index = combo_array[0]
    second_index = combo_array[1]
    third_index = combo_array[2]

    arr = [board[first_index], board[second_index], board[third_index]]
    all_x = arr.all? do |value|
      value == "X"
    end
    all_o = arr.all? do |value|
      value == "O"
    end

    if all_x
      return "X"
    end
    if all_o
      return "O"
    end
  end
  return nil
end

board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
puts full?(board)

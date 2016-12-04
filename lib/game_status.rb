# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # First diagonal
  [2,4,6]  # Second diagonal
]

def won?(board)
  win = WIN_COMBINATIONS
  counter = 0
  counter_full = 0
  counter_x = 0
  counter_o = 0
  result = 0
  win.each do |combo|
    combo.each do |item|
      if board[item] == "X"
        counter_x += 1
      elsif board[item] == "O"
        counter_o += 1
      end
      if counter_x == 3 || counter_o == 3
        result = win[counter]
      end
    end
    counter_x = 0
    counter_o = 0
    counter += 1
  end
  if result.kind_of?(Array) == true
      return result
  elsif result.kind_of?(Array) == false
    board.each do |vacant|
      if vacant == "" || vacant == " "
        counter_full += 1
      end
    end
    if counter_full == 9
      return false
    end
  end
  if result.kind_of?(Array) == false && counter_full < 9
    counter = 0
    while counter < board.size && position_taken?(board, counter) == true do
        counter+= 1
    end
    if counter == 9
      return false
    end
  end
end

def full?(board)
  if board.include?("") || board.include?(" ")
    false
  elsif won?(board) == false
    true
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
    true
  elsif won?(board)
    false
  else
    false
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  elsif full?(board) == false
    false
  end
end

def winner(board)
  player = won?(board)
  if player.kind_of?(Array) && board[player[0]] == "X" && board[player[1]] == "X" && board[player[2]] == "X"
    "X"
  elsif player.kind_of?(Array) && board[player[0]] == "O" && board[player[1]] == "O" && board[player[2]] == "O"
    "O"
  else
    return nil
  end
end

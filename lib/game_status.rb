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
    WIN_COMBINATIONS.each do |win_combo|
      number_f = win_combo[0]
      number_s = win_combo[1]
      number_t = win_combo[2]
      if board[number_f] == "X" && board[number_s] == "X" && board[number_t] == "X"
        return [number_f, number_s, number_t]
      elsif board[number_f] == "O" && board[number_s] == "O" && board[number_t] == "O"
        return [number_f, number_s, number_t]
      end
    end
  return false
end

def full?(board)
  board.each do |square|
    if square == " " || square == "" || square == nil
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    win_array = won?(board)
    find_letter = win_array[0]
    return board[find_letter]
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    position_1 = win_combo[0]
    position_2 = win_combo[1]
    position_3 = win_combo[2]
    if position_taken?(board, position_1) && position_taken?(board, position_2) && position_taken?(board, position_3)
      if board[position_1] == board[position_2] && board[position_2] == board[position_3]
        return win_combo
      else
        false
      end
    else
      false
    end
  end
  false
end

def full?(board)
  board.each_index do |i|
    return false if !position_taken?(board, i)
  end
  true
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
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
  win_combo = won?(board)
  win_combo ? board[win_combo[0]] : nil
end

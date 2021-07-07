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
    win_idx_1 = win_combo[0]
    win_idx_2 = win_combo[1]
    win_idx_3 = win_combo[2]
    
    pos_1 = board[win_idx_1]
    pos_2 = board[win_idx_2]
    pos_3 = board[win_idx_3]
    
    if pos_1 == 'X' && pos_2 == "X" && pos_3 == "X"
      return win_combo
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
    return win_combo
    end
  end
  false
end

def full?(board)
  board.all? {|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  return true if full?(board) && !won?(board)
end

def over?(board)
  return true if draw?(board)
  return true if won?(board)
end

def winner(board)
  if won?(board) == false
    return nil
  end
  
  win = won?(board)
  
  if board[win[0]] == "X"
    return "X"
  else
    "O"
  end
end
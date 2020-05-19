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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    else
      false
    end
  end
end


def full?(board)
  board_full = true
  counter = 0
  board.each do |array| 
    if position_taken?(board, counter) == false
      board_full = false
    end
    counter += 1
  end
  board_full
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else 
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    true
  else 
    false
  end
end

def winner(board)
  if won?(board) == false 
    return nil
  end
  
  WIN_COMBINATIONS.any? do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      false
    end
  end
end

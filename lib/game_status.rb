# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6]
]

def won?(board)
  winning_combo = []
  
  WIN_COMBINATIONS.each do |win_combos|
    counterX = 0
    counterO = 0

    win_combos.each do |win_index|
      if board[win_index] == "X"
        counterX += 1 
      elsif board[win_index] == "O"
        counterO += 1
      end
    end
    
    if counterX == 3 || counterO == 3
      winning_combo = [
        win_combos[0], 
        win_combos[1], 
        win_combos[2]
      ]
    end     
    
  end
  
  if winning_combo.length > 0
    winning_combo
  else
    false
  end
  
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else 
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    if board[win_combo[0]] == "X"
      return "X"
    elsif board[win_combo[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end

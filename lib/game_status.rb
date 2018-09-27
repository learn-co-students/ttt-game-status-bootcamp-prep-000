# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], # 1 Top row 
    [3,4,5], # 2 Middle row 
    [6,7,8], # 3 Bottom row 
    [0,3,6], # 4 Left vertical
    [1,4,7], # 5 Middle vertical
    [2,5,8], # 6 Right vertical
    [0,4,8], # 7 Vertical 1
    [6,4,2] # 8 Vertical 2    
  ]
  
# won? returns winning combo indexes as an array if there is a win or false is no win
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  !(board.include?(' ') || board.include?('')) ? true : false
end

def over?(board)
  won?(board) || draw?(board)
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

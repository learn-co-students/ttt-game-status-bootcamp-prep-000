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
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    # load the value of the board at each win_index
    position_1 = board[win_index_1] # board[0]
    position_2 = board[win_index_2] # board[1]
    position_3 = board[win_index_3] # board[2]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? { |index| index == "X" || index == "O"}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  if
    (full?(board) == false && won?(board) == false) ||
    (full?(board) == true)
    return false
  end
end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
  return true
end
end

def winner(board)
  if won?(board) != false
  return board[won?(board).last]
end
end
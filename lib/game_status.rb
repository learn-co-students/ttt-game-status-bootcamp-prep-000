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
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return [win_index_1, win_index_2, win_index_3]
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return [win_index_1, win_index_2, win_index_3]
    end
  end
  return nil
end

def full?(board)
  board.each do |slot|
    if (slot.nil? || slot == " ")
      return false
    end
  end
  return true
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  win_combination =won?(board)
  if win_combination.nil?
    return nil
  else
    return board[win_combination[0]]
  end
end

#    it 'return X when X won' do
#board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
#    expect(winner(board)).to eq("X")
#puts winner(board)

#    it 'returns O when O won' do
#board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
#    expect(winner(board)).to eq("O")
#puts winner(board)

#    it 'returns nil when no winner' do
#board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
#      expect(winner(board)).to be_nil
#puts winner(board)




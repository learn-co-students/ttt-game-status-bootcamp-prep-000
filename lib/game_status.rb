# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Down diagonal
  [2,4,6]  # Up diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    windex_1 = win_combination[0]
    windex_2 = win_combination[1]
    windex_3 = win_combination[2]

    if position_taken?(board, windex_1) && board[windex_1] == board[windex_2] && board[windex_1] == board[windex_3]
      return [windex_1, windex_2, windex_3]
    end
  end

  return false
end

def full?(board)
  board.all? {|value| value == "X" || value == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
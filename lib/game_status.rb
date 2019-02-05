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


winner = ""
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if(win_combo.all? {|index| (position_taken?(board,index))})
      if(win_combo.all? {|ele| board[ele] == "X"})
        winner = "X"
        return win_combo
      elsif(win_combo.all? {|ele| board[ele] == "O"})
        winner = "O"
        return win_combo
      end
    end
  end
  return false
end

def full?(board)
  board.none? {|ele| ele == " "}
end

def draw?(board)
  if(full?(board))
    return !won?(board)
  end
end

def over?(board)
  if(draw?(board) || won?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combo|
    if(win_combo.all? {|index| (position_taken?(board,index))})
      if(win_combo.all? {|ele| board[ele] == "X"})
        return "X"
      elsif(win_combo.all? {|ele| board[ele] == "O"})
        return "O"
      end
    end
  end
  return nil
end
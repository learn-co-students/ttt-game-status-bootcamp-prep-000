# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # left Horizontal row
  [1,4,7],  # middle Horizontal row
  [2,5,8],  # right Horizontal row
  [0,4,8],  # diagonal one
  [2,4,6]  # diagonal two
]

def won?(board)
  #iterate over combinations
  #see any combinations have matching symbols
  #go over combo
  woncom = []
  WIN_COMBINATIONS.each do |i|
  #for each combo get the board spots
    spot1 = board[i[0]]
    spot2 = board[i[1]]
    spot3 = board[i[2]]
  #if board spots match return that combo
    if spot1 == "X" && spot2 == "X" && spot3 == "X" || spot1 == "O" && spot2 == "O" && spot3 == "O"
    woncom << i[0]
    woncom << i[1]
    woncom << i[2]
    end
  #else return nil
  end
  if woncom == []
    false
  else
    woncom
  end
end

def full?(board)
board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end

end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  win = won?(board)
  if win != false
    tar = win[0]
    if board[tar] == "X"
      ret = "X"
    elsif board[tar] == "O"
      ret = "O"
    end
    ret
  else
    nil
  end
end

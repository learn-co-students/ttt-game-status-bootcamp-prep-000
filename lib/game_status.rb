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
  if !board.empty?
    WIN_COMBINATIONS.each do |combination|
      position_1 = board[combination[0]]
      position_2 = board[combination[1]]
      position_3 = board[combination[2]]

      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
        (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return combination
      end
    end
  end
  false
end

def full?(board)
  board.each do |element|
    if element == " " || element == ""
      return false
    end
  end
  true
end

def draw?(board)
  if full?(board) == true
    if won?(board) == false
      return true
    end
  end
  false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  isWin = won?(board)
  if isWin != false
    return board[isWin[0]]
  end
end

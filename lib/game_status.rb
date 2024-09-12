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
  WIN_COMBINATIONS.each do |combination|
    win1 = combination[0]
    win2 = combination[1]
    win3 = combination[2]
    position1 = board[win1]
    position2 = board[win2]
    position3 = board[win3]
    if position1 == "X" && position2 == "X" && position3 == "X"
      return combination
    elsif position1 == "O" && position2 == "O" && position3 =="O"
      return combination
    end
  end
  return false
end

def full?(board)
  board.all? {|position| position=="X" || position=="O"}
end

def draw?(board)
  if full?(board) && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    board[won?(board)[0]] == "X" ? "X":"O"
  end
end

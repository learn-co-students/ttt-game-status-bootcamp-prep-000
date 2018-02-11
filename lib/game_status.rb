# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  xWon = false
  oWon = false
  WIN_COMBINATIONS.each { |winCombo|
    xWon = winCombo.all? do |index|
      board[index] == 'X'
    end
    if xWon == true
      return winCombo
    end
    oWon = winCombo.all? do |index|
      board[index] == 'O'
    end
    if oWon == true
      return winCombo
    end
  }
  return false
end

def full?(board)
  board.none? { |index| index == ' ' || index == ''}
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
  if won?(board) != false
    board[won?(board)[0]]
  else
    nil
  end
end
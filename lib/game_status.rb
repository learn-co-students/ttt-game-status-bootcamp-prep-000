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
    xCounter = 0
    oCounter = 0
    combination.each do |index|
      if board[index] == "X"
        xCounter +=1
      elsif board[index] == "O"
        oCounter +=1
      end
      if (xCounter == 3) || (oCounter == 3)
        return combination
      end
    end
  end
  false
end

def full?(board)
  board.none?{|index| index == " " || index == nil}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  index = won?(board)
  if !won?(board)
    nil
  elsif board[index[0]] == 'X' && board[index[1]] == 'X' && board[index[2]] == 'X'
    'X'
  else
    'O'
  end
end

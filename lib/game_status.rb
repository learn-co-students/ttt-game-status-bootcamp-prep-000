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
  WIN_COMBINATIONS.detect do |combination|
    combination.all? { |index| board[index] == 'X' } || combination.all? { |index| board[index] == 'O' }
  end
end

def full?(board)
  board.none? { |square| square.nil? || square == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
   if winning_combination = won?(board)

first_winning_index = winning_combination[0]
  board[first_winning_index]
  end
end
def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end

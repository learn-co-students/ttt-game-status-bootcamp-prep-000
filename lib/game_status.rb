# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    val1 = board[combo[0]]
    val2 = board[combo[1]]
    val3 = board[combo[2]]
    if position_taken?(board, combo[0]) && val1 == val2 && val2 == val3
      return combo
    end
  end
  false
end

def full?(board)
  board.all?{|val| ["X", "O"].include?(val)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  combo = won?(board)
  if combo
    return board[combo[0]]
  end
end

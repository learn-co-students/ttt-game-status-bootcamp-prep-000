require "pry"
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
  WIN_COMBINATIONS.each do |combo|
    pos_1 = board[combo[0]]
    pos_2 = board[combo[1]]
    pos_3 = board[combo[2]]

    return combo if pos_1 == pos_2 && pos_3 == pos_1 && position_taken?(board, combo[0])
  end
  false
end

def full?(board)
  !board.find { |square| square == " " }
end

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  (draw?(board) || won?(board))
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end

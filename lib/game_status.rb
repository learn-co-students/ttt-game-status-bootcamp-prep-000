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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    spot_1 = board[combo[0]]
    spot_2 = board[combo[1]]
    spot_3 = board[combo[2]]

    if spot_1 != " " && spot_2 != " " && spot_3 != " "
      spot_1 == spot_2 && spot_2 == spot_3
    end
  end
end

def full?(board)
  board.none? {|spot| spot == " "}
end

def draw?(board)
  !won?(board) if full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win = won?(board)
  board[win[0]] if win
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [3,4,5],
  [2,4,6],
  [6,7,8],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |winner|
    index_0 = winner[0]
    index_1 = winner[1]
    index_2 = winner[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
       position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winner
    end
  end
    false
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

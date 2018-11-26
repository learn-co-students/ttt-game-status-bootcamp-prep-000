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
    next if !position_taken?(board, combo[0]) || !position_taken?(board, combo[1]) || !position_taken?(board, combo[2])
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      return combo
    end
  end
  false
end

def full?(board)
  board.all? {|pos| pos != nil && pos != " "}
end

def draw?(board)
  if !full?(board)
    return false
  end
  !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  winner = won?(board)
  winner ? board[winner[0]]: nil
end

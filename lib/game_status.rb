def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
      position
    elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
      position
    else
      false
    end
  end
end

def full?(board)
  board.all? {|token| token == "X"||token == "O"} ? true : false
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board).is_a?(Array) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  won?(board).class != Array ? nil : board[won?(board)[0]]
end

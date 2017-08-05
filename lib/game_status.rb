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
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    position = [
      board[win_combination[0]],
      board[win_combination[1]],
      board[win_combination[2]]
    ]

    if position.select{|i| i == "X"}.length == 3 || position.select{|i| i == "O"}.length == 3
      return win_combination
    end

  end

  return false
end

def full?(board)
  board.select{|i| i == "X"}.length + board.select{|i| i == "O"}.length == 9
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

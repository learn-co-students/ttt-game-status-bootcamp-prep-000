# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

test = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]

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
  # WIN_COMBINATIONS.each do |win_condition|
  #   if board[win_condition[0]] == "X" && board[win_condition[1]] == "X" && board[win_condition[2]] == "X"
  #     return win_condition
  #   elsif board[win_condition[0]] == "O" && board[win_condition[1]] == "O" && board[win_condition[2]] == "O"
  #     return win_condition
  #   end
  # end
  # return false


  # WIN_COMBINATIONS.each do |win_condition|
  #   if board[win_condition[0]] == board[win_condition[1]] &&  board[win_condition[1]] == board[win_condition[2]] && position_taken?(board, win_condition[0])
  #     return win_condition
  #   end
  # end
  # return false

  WIN_COMBINATIONS.find do |win_condition|
    board[win_condition[0]] == board[win_condition[1]] &&  board[win_condition[1]] == board[win_condition[2]] && position_taken?(board, win_condition[0])
  end
end

def full?(board)
  board.none? {|x| x == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

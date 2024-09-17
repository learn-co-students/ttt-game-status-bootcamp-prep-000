# Helper Method
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
  # detect returns win_combination or nil, nil is not the same as false so you can't do won?(board) == false, only won?(board) == nil
  # WIN_COMBINATIONS.find{|x| board[x[0]] == board[x[1]] && board[x[1]] == board[x[2]] && board[x[1]] != " "}
  WIN_COMBINATIONS.detect do |win_combination| # first loop [0,1,2], second loop [3,4,5]
    # board which is an array of "X", "O", " "
    # win_combination which is the nested array inside WIN_COMBINATIONS : example on the first iteration will be [0,1,2]
    # check the board by the given indexes to see if the values are the same and not " "
    win_index_1 = win_combination[0] # win_index_1 value is 0
    win_index_2 = win_combination[1] # win_index_2 value is 1
    win_index_3 = win_combination[2] # win_index_3 value is 2

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      win_combination
    end
  end
end

def full?(board)
  board.all? do |x|
    x == "X" || x == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  winner = won?(board)
  if winner != nil
    board[winner[0]]
  end
end

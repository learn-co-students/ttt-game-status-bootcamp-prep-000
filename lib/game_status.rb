# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [6,4,2],
  [0,4,8],
  [1,4,7],
  [0,3,6],
  [2,5,8]
]

def won?(board)
winner = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    # empty_board = (position_1 == " " && position_2 == " " && position_3 == " ")
    winning_move = (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    # draw = (position_1 == "X" && position_2 == "O" && position_3 == "X") || (position_1 == "O" && position_2 == "X" && position_3 == "O")

    if winning_move
      winner = true
      return win_combination # return the win_combination indexes that won.
    else
      winner = false
    end
  end
winner
end


def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board) || !won?(board)
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner?(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

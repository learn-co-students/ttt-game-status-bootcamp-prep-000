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
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    pos1 = board[win_index_1]
    pos2 = board[win_index_2]
    pos3 = board[win_index_3]

    if pos1 == "X" && pos2 == "X" && pos3 =="X" || pos1 == "O" && pos2 == "O" && pos3 =="O"
      return win_combination
    else
    end
  end
  return nil
end

def full?(board)
  board.all? {|element| element != " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  array = won?(board)
  if won?(board)
    return board[array[0]]
  else
    nil
  end
end

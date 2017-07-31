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
  count = 0
  while count < WIN_COMBINATIONS.length
    win_index_1 = WIN_COMBINATIONS[count][0];
    win_index_2 = WIN_COMBINATIONS[count][1];
    win_index_3 = WIN_COMBINATIONS[count][2];

    position_1 = board[win_index_1];
    position_2 = board[win_index_2];
    position_3 = board[win_index_3];

    if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
      return WIN_COMBINATIONS[count]
    else
      false
    end
    count += 1
  end
end

def full?(board)
  board.all? do |entry|
    entry == 'X' || entry == 'O'
  end
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
  winner = won?(board)
  if winner.is_a?(Array)
    return board[winner[0]]
  else
    return winner
  end
end

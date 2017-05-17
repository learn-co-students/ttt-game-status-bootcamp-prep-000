# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #horizonal rows
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  #vertical rows
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  #diagonals
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  is_empty = board.all?{|i| i == " "}

  if not is_empty
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board[win_combination[0]]
      position_2 = board[win_combination[1]]
      position_3 = board[win_combination[2]]

      win = [position_1, position_2, position_3].all? do |char|
        char != " " and char == position_1
      end

      if win
        return win_combination
      end
    end
  end
  return false
end

def full?(board)
  return board.all?{|i| i != " "}
end

def draw?(board)
  won = won?(board)
  full = full?(board)

  if not won and full
    return true
  end
  return false
end

def over?(board)
  if draw?(board) or won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  won = won?(board)

  if won
    return board[won[0]]
  else
    nil
  end
end

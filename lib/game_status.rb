# Helper Methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#  Next three methods are helpers for won?() method
def all_positions_taken?(combination, board)
  combination.all? do | index |
    position_taken?(board, index)
  end
end

def all_elements_equal?(array)
  array.all? { |element| element == array[0] }
end

def array_subset(indices, array)
  indices.map { |i| array[i] }
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

# iterate over WIN_COMBINATIONS
# take one combination and check if all positions were taken on the board
# if all positions were taken, iterate over combination and pick out board elements with those positions
# iterate over board subset and check if all elements are the same
# if the same, exit won function and return board subset
# if not, continue with the next combination

def won?(board)
  winning_combination = nil

  WIN_COMBINATIONS.each do | combination |
    if all_positions_taken?(combination, board) && all_elements_equal?(array_subset(combination, board))
      winning_combination = combination
      break
    end
  end

  winning_combination
end

def full?(board)
  board.all? do | position |
    position != " "
    # && position != nil && position != ""
  end
end

def draw?(board)
  !won?(board) && full?(board) ? true : false

  # if !won?(board) && full?(board)
  #   return true
  # end
  #
  # return false

  # if !won?(board)
  #   if full?(board)
  #     return true
  #   end
  # else return false

  # if !won?(board) && full?(board)
  #   return true
  # elsif !won?(board) && !full?(board)
  #   return false
  # elsif won?(board)
  #   return false
  # end
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  winning_set = won?(board)

  if !winning_set
    return nil
  end

  winning_player = board[winning_set[0]]
end

# won?(["O", " ", "X", "O", " ", "X", "O", " ", " "])

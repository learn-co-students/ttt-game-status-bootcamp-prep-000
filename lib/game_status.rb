# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # l-r diagonal
  [2, 4, 6] # r-l diagonal
]


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
      return win_combination
    end
  end
  return false
end


def full?(board)
  # returns true if board is full
  board.none?{ |element| element == " "}
end


def draw?(board)
  # returns true if board has not been won and is full
  if won?(board) == false && full?(board) == true
    return true
  # returns false if the board is not won and is not full
  elsif won?(board) == false && full?(board) == false
    return false
  # returns false if board is won
  elsif won?(board) != false
    return false
  end
end


def over?(board)
  # returns true if board has been won, is a draw, or is full
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
end


def winner(board)
  # return the token that has won the game
  if won?(board) == false || draw?(board) == true
    return nil
  end
  winning_line = won?(board)
  index = winning_line[0]
  return board[index]
end

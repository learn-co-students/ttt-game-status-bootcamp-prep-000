

# Define your WIN_COMBINATIONS constant
board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
$win = nil
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
      $win = position_1
      return win_combination # return the win_combination indexes that won.
    else
      $win = nil
      winner = false
    end
  end
winner
end

def full?(board)
  counter = 0
  board.each do |count|
  if count == "X" || count == "O"
    counter += 1
    end
  end
  if counter == 9
    true
  else
    false
    end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end


def winner(board)
  won?(board)
  $win
end


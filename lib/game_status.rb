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
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |winning|
    win_index_1 = winning[0]
    win_index_2 = winning[1]
    win_index_3 = winning[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 = "X" && position_2 == "X" && position_3 == "X"
      return winning
    elsif position_1 = "O" && position_2 == "O" && position_3 == "O"
      return winning
    else
      false
end
end
end

def full?(board)
  board.all? do |character|
    character == "X" || character == "O"
end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else return false
  end
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else return false
end
end

def winner(board)
  if winning_game = won?(board)
    board[winning_game.first]
  end
end

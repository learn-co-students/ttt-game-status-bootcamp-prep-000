# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  winning_array = []
  position = []
  winner_winner = false
  WIN_COMBINATIONS.each do |win_combination|
    position[0] = board[win_combination[0]]
    position[1] = board[win_combination[1]]
    position[2] = board[win_combination[2]]
    all_x = position.all? do |value|
      value == "X"
    end
    all_o = position.all? do |value|
      value == "O"
    end
    if all_x == true || all_o == true
      winning_array = win_combination
      winner_winner = true
    end
  end
  if winner_winner == true
    winning_array
  else
    false
  end
end

def full?(board)
  board.all? do |space|
  !(space.nil? || space == " ")
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  game_won = WIN_COMBINATIONS.any? do |winning_combination|
    winning_combination == won?(board)
  end
if game_won == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination == false
    nil
  else
    board[winning_combination[0]]
  end
end

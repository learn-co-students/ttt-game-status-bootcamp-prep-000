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
  [2, 4, 6]
]
def won?(board)
  game_winner = nil
  WIN_COMBINATIONS.each do |winning_set_arr|
    if winning_set_arr.all? {|num| board[num] == "X"}
      game_winner = winning_set_arr
    elsif winning_set_arr.all? {|num| board[num] == "O"}
      game_winner = winning_set_arr
    else
      false
    end
  end
  if game_winner == nil
    false
  elsif game_winner != nil
    game_winner
  end
end

def full?(board)
  board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  end
end

def winner(board)
  game_winner = nil
    WIN_COMBINATIONS.each do |winning_arr|
      if winning_arr.all? {|letter| board[letter] == "X"}
        game_winner = "X"
      elsif winning_arr.all? {|letter| board[letter] == "O"}
        game_winner = "O"
      else
    end
  end
  return game_winner
end

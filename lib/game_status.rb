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
  if board.all?{|v| v == " "}
    return false
  end
  WIN_COMBINATIONS.each do | winning_combo_indicies |
    winning_index_one = winning_combo_indicies[0]
    winning_index_two = winning_combo_indicies[1]
    winning_index_three = winning_combo_indicies[2]
    if board[winning_index_three] == "" || board[winning_index_three] == " " || board[winning_index_three] == nil
      false
    elsif board[winning_index_one] == board[winning_index_two] && board[winning_index_two] == board[winning_index_three]
      return winning_combo_indicies
    end
  end
  false
end

def full?(board)
  !(board.any?{|i| i == " "})
end

def draw?(board)
  if full?(board)
    if won?(board)
      false
    else
      true
    end
  else
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
  else
    false
  end
end

def winner(board)
  winningCombo = won?(board)
  if winningCombo
    winner = board[winningCombo[0]]
  end
end

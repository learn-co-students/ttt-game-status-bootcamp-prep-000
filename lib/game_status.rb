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
  [6,7,8],
  [0,4,8],
  [2.4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do | combo |
    combo.each do | c |
      v1 = c[0]
      v2 = c[1]
      v3 = c[2]
      if v3 == "" || v3 == " " || v3 == nil
        false
      elsif v1 == v2 && v2 == v3
        return combo
      end
    end
  end
  false
end

def full?(board)
  !(board.any?{|i| i == " "})
end

def draw?(board)
  if full?(board)
    if (won?(board))
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
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
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

def won?(b)
  win_comb = nil
  WIN_COMBINATIONS.each do |c|
    if (b[c[0]] == "X" || b[c[0]] == "O") && (b[c[0]] == b[c[1]] && b[c[1]] == b[c[2]]) # b = board and c = combination
      win_comb = c
    end
  end
    win_comb
  end

def full?(board)
  !(board.any?{|e| e == ""} || board.any?{|e| e == " "})
end

def draw?(board)
  status = false
  if !won?(board) & full?(board) # true means a draw because the board is not won but full
    status = true
  elsif !won?(board) & !full?(board) || won?(board) # false means a draw if the board is neither full nor won, or if the board is won
    status = false
  end
  status
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winner = won?(board) # e.g [0,1,2]
  if winner != nil
    winner = board[winner[0]]
  end
  winner
end

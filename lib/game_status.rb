# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], #Rows
                     [0,3,6], [1,4,7], [2,5,8], # Columns
                     [0,4,8], [6,4,2] #Diagonals
                    ]

def won?(board)
  x_wins = false
  y_wins = false
  WIN_COMBINATIONS.each do |combo|
    x_wins = combo.all? {|i| board[i] == "X"}
    y_wins = combo.all? {|i| board[i] == "O"}
    if(x_wins || y_wins)
      return combo
    end
  end
  false
end

def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  if(winning_combo)
    return board[winning_combo[0]]
  else
    return nil
  end
end

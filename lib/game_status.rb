# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # Diagonal from top left to bottom right
  [6,4,2]  # Diagonal from bottom left to top right
]

def won?(board)
  winning_combo = [];
  WIN_COMBINATIONS.each do |combination|
    combination_moves = [board[combination[0]],
                         board[combination[1]],
                         board[combination[2]]]
    won = combination_moves.all? do |character|
      if character == "X" || character == |"O"|
        winning_combo = combination
    end
  end
  if won {return winning_combo}
end

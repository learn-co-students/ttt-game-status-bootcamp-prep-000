# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # left-right diag
  [2, 4, 6]  # right left diag
]

def won?(board)

  WIN_COMBINATIONS.each do |combo| # iterate over each win combo
    pos_0 = board[combo[0]] # store board values in corresponding win combo indices
    pos_1 = board[combo[1]]
    pos_2 = board[combo[2]]
    if position_taken?(board, combo[0]) && pos_0 == pos_1 && pos_1 == pos_2
      return combo
    end
  end # end .each
  false
end # end def

def full?(board)
  board.all? do |character|
    character == "X" || character == "O"
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  end
end


def over?(board)
  won?(board) || full?(board)
end


def winner(board)
  if combo = won?(board)
    char = board[combo[0]]
    return char
  elsif draw?(board) || !over?(board)
    return nil
  end
end

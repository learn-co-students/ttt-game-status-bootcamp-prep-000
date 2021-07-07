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

  WIN_COMBINATIONS.each do |win_combination|

    positions_to_check  = [board[win_combination[0]],
                          board[win_combination[1]],
                          board[win_combination[2]]]

    if positions_to_check.all?{|position| position == "X"} ||
        positions_to_check.all?{|position| position == "O"}
      return win_combination
    end
  end
  false # no winning combinations were found, return false
end

def full?(board)

  board.each_with_index do |val, index|
    if !position_taken?(board, index)
      return false
    end
  end
  true # all the positions must have been taken
end

def draw?(board)

  !won?(board) && full?(board)

end

def over?(board)

  won?(board) || draw?(board)

end

def winner(board)
  winning_positions = won?(board)
  if winning_positions
    return board[winning_positions[0]]
  end
end

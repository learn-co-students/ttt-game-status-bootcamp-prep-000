# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def won?(board)
  WIN_COMBINATIONS.each do |win|
    positions = []
    counter = 0
    win.each do |index|
      positions[counter] = board[index]
      counter += 1
    end
    # if positions[0] == "X" && positions[1] == "X" && positions[2] == "X"
    #   return win
    # elsif positions[0] == "O" && positions[1] == "O" && positions[2] == "O"
    #   return win
    # else
    #   return false
    # end
    if positions.all? {|position| position == "X"}
      return win
    # elsif positions.all? {|position| position == "O"}
    #   return win
    # else
    #   return false
    end
  end
end


def full?(board)
  board.none?{|space| space == " "}
end


def draw?(board)

end


def over?(board)

end


def winner?(board)

end


# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Forward diagonal
  [2,4,6]  # Backward diagonal
]

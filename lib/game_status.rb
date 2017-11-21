# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def won?(board)
  WIN_COMBINATIONS.each do |win|
    position = []
    counter = 0
    win.each do |index|
      position[counter] = board[index]
      counter += 1
    end
    # if position[0] == "X" && position[1] == "X" && position[2] == "X"
    #   return win
    # elsif position[0] == "O" && position[1] == "O" && position[2] == "O"
    #   return win
    # else
    #   return false
    # end
    if position.all? {|check| check == "X"}
      return win
    elsif position.all? {|check| check == "O"}
      return win
    else
      return false
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

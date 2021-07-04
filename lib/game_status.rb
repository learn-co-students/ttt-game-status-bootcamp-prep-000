# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right row
  [0,4,8],  # First diagonal
  [2,4,6]  # Second diagonal
]


def won?(board)
  position = Array.new(3)
  if board.all?{|i| i == "" || i == " "}
    false
  else WIN_COMBINATIONS.each do |win_combination|
      i=0
      while i <3
        position[i] = board[win_combination[i]]
        i +=1
      end

      if position.all?{|value| value == "X"}
        return win_combination # return the win_combination indexes that won.
      else
        if position.all?{|value| value == "O"}
          return win_combination
        end
      end
    end
  end
  false
end

def full?(board)
  if board.all?{|i| i == "X" || i == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    if board[won?(board)[0]] == "X"
      "X"
    else
      "O"
    end
  end

end

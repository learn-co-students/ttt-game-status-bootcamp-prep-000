# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Vertical left
  [1,4,7],  # Vertical middle
  [2,5,8],  # Vertical right
  [0,4,8],  # Diagonal
  [2,4,6]   # Diagonal
]

def won?(board)
  if board.none?{|i| i == "O" || i == "X" }
    #empty board
    false
  elsif
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board[win_combination[0]]
      position_2 = board[win_combination[1]]
      position_3 = board[win_combination[2]]
        if ( (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") )
          return [win_combination[0], win_combination[1], win_combination[2]]
        end
    end
  else full?(board)
    false
  end
end


def full?(board)
  board.all?{|i| i == "X" || i == "O" } ? true : false
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  else
    false
  end
end

def over?(board)
  true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    return board[win_combination[1]]
  else
    nil
  end    
end

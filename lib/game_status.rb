# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Horizontal 1-8
  [2,4,6]  # Horizontal 2-6
  # ETC, an array for each win combination
]

def won?(board)
  win_combination=false
  WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == "X" || board[combination[0]] == "O") && (board[combination[0]] == board[combination[1]]) && (board[combination[1]] == board[combination[2]])
      win_combination=combination
    end
  end
  return win_combination
end

def full?(board)
  board.all? {|char| char=="X" || char=="O"}
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

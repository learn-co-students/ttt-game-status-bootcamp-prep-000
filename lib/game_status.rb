# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # horizontal
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  # vertical 
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  # diagonal
  [0, 4, 8],
  [2, 4, 6]
  ]
  
def won?(board)
  # for each win_combination in WIN_COMBINATIONS 
  WIN_COMBINATIONS.each do |win_combination|
    # copypasta
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination 
    end
  end
  return false # empty board
end

def full?(board)
  # #all? syntax -> strings.all? { |str| str.size == 5 }
  board.all? { |space| space != "" && space != " " }
end

def draw?(board)
  # call full here // also won? has to return false
  full?(board) && !won?(board)
end

def over?(board)
  # won should return true OR full returns true
  won?(board) || full?(board)
  # this is fun
end

def winner(board)
  if won?(board) # won needs to return true
    board[won?(board).first] # witchcraft using .first()
  else
    nil
  end
end
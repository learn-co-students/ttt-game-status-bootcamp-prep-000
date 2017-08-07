# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #Top row
  [3,4,5],  #Middle row
  [6,7,8],  #Bottom row
  [0,3,6],  #First column
  [1,4,7],  #Seccond column
  [2,5,8],  #Third column
  [0,4,8],  #Diaginal top left to bottom right
  [2,4,6]   #Diaginal top right to bottom left
]
def won?(board)
  #WIN_COMBINATIONS.detect do |combo|
  #  winning_combo = combo.all? { |e| board[e.to_i].downcase == "x" }
  #  winning_combo = combo.all? { |e| board[e.to_i].downcase == "o" }
  #end
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && board[combo[0]] == "X"
      return combo
    elsif board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && board[combo[0]] == "O"
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? { |e| !(e.nil? || e == " ") }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if !won?(board)
    return nil
  else
    board[won?(board)[0]]
  end
end

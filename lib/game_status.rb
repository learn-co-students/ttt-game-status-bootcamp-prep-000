# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]) && board[combo[0]] != " "
      return combo
    end 
  end
  return false
end 

def full?(board)
  #if there are NO EMPTY SPACES
  board.none? { |i| i == " " }
end

def draw?(board)
  #if the board is FULL && nobody has WON
  board.none? { |i| i == " " } && !won?(board)
end

def over?(board)
  #if someone has WON, or it is DRAW
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
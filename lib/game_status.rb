# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && (board[combo[0]] == "X" || board[combo[0]] == "O")
      return combo
    end
  end
  return FALSE
end

def full?(board)
  board.detect{|cell| cell == " "} ? FALSE : TRUE
end

def draw?(board)
  !won?(board)&&full?(board)
end

def over?(board)
  won?(board)||draw?(board)
end

def winner(board)
  if over?(board) && !draw?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
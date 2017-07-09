# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #top row
  [3,4,5],  #mid row
  [6,7,8],  #bot row
  [0,3,6],  #left col
  [1,4,7],  #mid col
  [2,5,8],  #right col
  [0,4,8],  #left dig
  [2,4,6]   #right dig
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board,combo[0]) && board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]]
      return combo
    end
  end
  return false
end

def full?(board)
  (0..8).all? { |e| position_taken?(board,e) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

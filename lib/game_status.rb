# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?(board)
  return WIN_COMBINATIONS.find{|comb|
    ((comb.all?{|n| board[n]=='X'})||(comb.all?{|n| board[n]=='O'}))}
end
def full?(board)
  return board.all?{|a|a=='X'||a=='O'}
end
def draw?(board)
  return (!(won?(board)))&&full?(board)
end
def over?(board)
  return won?(board)||full?(board)
end
def winner(board)
  l=won?(board)
  if l==nil
    return nil
  else
    return board[l[0]]
  end
end

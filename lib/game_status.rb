# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]  # Middle row
  # ETC, an array for each win combination
]

def won?(board)
win_combination=[]
win=false

  WIN_COMBINATIONS.each do |comb|
    comb.each do |i|
      win_combination<<board[i]
    end
    if (win_combination.all?{|i| i=='X'})||(win_combination.all?{|i| i=='O'})
      return comb
    else win_combination=[]
    end
  end
  return win
end

def full? (board)
  board.none?{|i| i==' '}
end

def draw?(board)
if full?(board) && (won?(board) == false)
  return true
else return false
end
end

def over?(board)
  if full?(board) || (won?(board) != false) || draw?(board)
    return true
  else return false
  end
end

def winner(board)
winner=nil
comb=[]
if over?(board) && won?(board)
comb=won?(board)
winner = board[comb[0]]
end
return winner
end

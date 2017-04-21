# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  result = []
  WIN_COMBINATIONS.each do |comb|
    if (comb.all? {|el| board[el] == "X"}) || (comb.all? {|el| board[el] == "O"})
      return comb
    end
  end
  false
end

def full?(board)
  board.all? {|el| el == "X" || el == "O"}
end

def draw?(board)
  won?(board) || !full?(board) ? false:true
end

def over?(board)
  won?(board) || draw?(board) ? true:false
end

def winner(board)
  won?(board) ? board[won?(board)[0]]:nil
end

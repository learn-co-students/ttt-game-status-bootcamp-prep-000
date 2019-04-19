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
  ret = nil
  WIN_COMBINATIONS.each do |wc|
    if wc.all? {|index| position_taken?(board, index) && board[index] == board[wc[0]]}
      ret = wc
      break
    end
  end
  ret
end

def full?(board)
  board.all? {|cell| !cell.strip.empty?}
end

def draw?(board)
  full?(board) and won?(board).nil?
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  won = won?(board)
  board[won[0]] unless won.nil?
end

# puts won?(Array.new(8, ' '))
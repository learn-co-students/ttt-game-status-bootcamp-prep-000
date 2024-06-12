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
  [6,4,2]
]

def won?(board)
  flag = false
  WIN_COMBINATIONS.map do |x|
    xs = []
    x.each { |y| xs.push(board[y]) }
    flag = !xs.empty? && xs.all? { |x| x == "X" }
    flag = !xs.empty? && xs.all? { |x| x == "O" } if flag == false
    flag = x if flag
    break if flag
  end
  flag
end

def full? board
  board.all? { |x| x == "X" || x =="O" }
end

def draw? board
  full?(board) && !won?(board)
end

def over? board
  draw?(board) || won?(board)
end

def winner board
    x = won? board
    x.kind_of?(Array) ? board[x[0]] : nil
end

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
  WIN_COMBINATIONS.find do |combination|
    i1 = combination[0]
    i2 = combination[1]
    i3 = combination[2]
    p1 = board[i1]
    p2 = board[i2]
    p3 = board[i3]

    if p1 == p2 && p2 == p3 && (p1 == "X" || p1 == "O")
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? { |character| character == "X" || character == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  won ? board[won[0]] : nil
end

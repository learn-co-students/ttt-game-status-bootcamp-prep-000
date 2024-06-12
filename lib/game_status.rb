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
  oo = []
  WIN_COMBINATIONS.each do |e1|
    e1.each {|e2| oo << board[e2]}
    if oo.all? {|e3| e3 == "X"} || oo.all? {|e3| e3 == "O"}
      return e1
    else
        oo = []
    end
  end
  return false
end

def full?(board)
  board.all? {|e| position_taken?(board, board.index(e))}
end

def draw?(board)
  if won?(board) || full?(board) == false
    return false
  else
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if draw?(board) || over?(board) == false
    return nil
  else
    return board[won?(board)[0]]
  end
end

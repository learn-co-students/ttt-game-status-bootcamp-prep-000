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
  win = []
  WIN_COMBINATIONS.each {|i|
    if board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X"
      win.push(i[0], i[1], i[2])
    elsif board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O"
      win.push(i[0], i[1], i[2])
    end
  }
  if win.empty?
    return false 
  else
    win
  end
end

def full?(board)
  if !board.include?(" ")
    true 
  end
end

def draw?(board)
  if full?(board) == true && won?(board) ==  false 
    true
  elsif full?(board) == false && won?(board) == false
    false
  elsif won?(board) != false
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    true 
  end
end

def winner(board)
  if won?(board) == false
    nil
  else   
    board[won?(board)[0]]
  end
end
    
  

  
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

def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
end


def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| board[idx] == "X"}
      winner = combo
    elsif combo.all? {|idx| board[idx] == "O"}
      winner = combo
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end
  


def full?(board)
  board.all? {|token| token == "X" || token == "O"}
    
end

def draw?(board)
  if full?(board) && !(won?(board))
    true
  else 
    false
  end
end

def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| board[idx] == "X"}
      winner = "X"
    elsif combo.all? {|idx| board[idx] == "O"}
      winner = "O"
    else
    end
  end
  winner
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
end






  




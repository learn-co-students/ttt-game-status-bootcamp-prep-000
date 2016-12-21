# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  store=WIN_COMBINATIONS.select do |combination|
    board[combination[0]]=="X" && board[combination[1]]=="X"&& board[combination[2]]=="X" || board[combination[0]]=="O" && board[combination[1]]=="O"&& board[combination[2]]=="O"
  end
  store=store[0]
  if store==[] || store== nil
    false
  else  store
  end

end

def full?(board)
  board.all? do |board_position|
 !(board_position.nil? || board_position == " " || board_position =="")
end
end

def draw?(board)
  if won?(board)!=false  #the game is won
    nil
  # the game is not won
elsif full?(board)==true  #the board is full
    true
  else                    #the board is not full
    false
  end
end
  #board_position # Will evaluate to true for 1, false for 2, true for 3

def over?(board)
  if draw?(board)
  true
  elsif won?(board)
  true
  else
  false
  end
end

def winner(board)

  no_x=board.select do |x|
  x=="X"
  end

  no_o=board.select do |o|
  o=="O"
  end

  if won?(board)==false
    nil
  elsif no_x.count > no_o.count
  "X"
  else
  "O"
  end


end

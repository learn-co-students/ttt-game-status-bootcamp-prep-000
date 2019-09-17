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
  winner = []
  empty_board = board.all? {|x| x == " "}
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? { |win_index| board[win_index] =="X" } || win_combination.all? { |win_index| board[win_index] =="O" }
     winner = win_combination
     
   else
     false
    end
  end
  if winner == []
    false
  else
    winner
  end
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if  full?(board)  && !won?(board)
    true
  elsif !won?(board) && !full?(board) || won?(board)
     false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end
  
def winner(board)
  if !won?(board)
    nil
  elsif  won?(board).all? {|value| board[value] == "X"}
    "X"
  elsif won?(board).all? {|value| board[value] == "O"}
    "O"
  end
end
        
      
    
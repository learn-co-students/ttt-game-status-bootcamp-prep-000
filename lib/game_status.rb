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
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]
    if ((pos_1 == "X" && pos_2 == "X" && pos_3 == "X") ||   (pos_1 == "O" && pos_2 == "O" && pos_3 == "O"))  
      puts "win combo #{win_combo}"
      return [win_index_1, win_index_2, win_index_3]
    else
      false
    end
  end
  false
end

def full?(board) 
  board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?(board) 
  if(full?(board) && !won?(board))
    true 
  else
    false
  end
end

def over?(board)
  if(full?(board) || draw?(board) || won?(board))
    true
  else 
    false
  end
end
      
def winner(board)
  if(won?(board))
    if(board[won?(board)[0]] == "X")
      return "X"
    else
      return "O"
    end
  else 
    nil
  end
end
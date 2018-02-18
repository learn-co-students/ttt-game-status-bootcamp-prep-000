# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constants
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_0 = win_combination[0]
      pos_1 = board[win_index_0]
      
      win_index_1 = win_combination[1]
      pos_2 = board[win_index_1]
      
      win_index_2 = win_combination[2]
      pos_3 = board[win_index_2]
      
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") 
        return win_combination
        elsif
        (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        return win_combination
      else
         FALSE
      end
      
    end
    FALSE
end

def full?(board)
   board.all? {|item| item == "X" || item == "O"}
  
end

def draw?(board)
  return true if !won?(board) &&  full?(board)
  return FALSE if !won?(board) && !full?(board)
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  #if it exists, catch the return value from the call to won? in player_won, return the board array with a call to the first method on player_won as the board element
  if player_won = won?(board)
    board[player_won.first]
  end 
end
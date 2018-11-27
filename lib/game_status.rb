# Helper Method I didn't use this at all oops 
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant 
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won? (board)
   result = WIN_COMBINATIONS.map do |wincombo| 
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X" 
      wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O" 
      wincombo
    else
      false
    end 
   end 
    if result.all?{ |wincombo| wincombo == false}
      false
    else
      result.delete(false)
      result.flatten
    end   
end 


def full? (board)
  if board.include?("") || board.include?(" ")
    false
  else
    true
  end 
end

def draw? (board)
  if won?(board) != false
    false
  elsif full?(board)
    true 
  else
    false
  end 
end 

def over? (board)
  if won?(board) != false
    true
  elsif draw?(board)
    true
  else
    false
  end 
end 

def winner (board)
  if won?(board) == false
    nil
  elsif board.count("X") > board.count("O")
    "X"
  else
    "O"
  end 
end 
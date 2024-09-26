# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Right col
  [1,4,7], #Center col
  [2,5,8], #Left col
  [0,4,8], #Diagonal
  [2,4,6] #Diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    pos1 = board[win_combination[0]]
    pos2 = board[win_combination[1]]
    pos3 = board[win_combination[2]]

    if (pos1 == "X") && (pos2 == "X") && (pos3 == "X")
      return win_combination
    else
      if (pos1 == "O") && (pos2 == "O") && (pos3 == "O")
        return win_combination
      else
        if (board.all?{|i| (i == "")}) || (board.all?{|i| (i == " ")}) #Empty
          return false
        else
          if ( draw?(board) == true ) #Nobody won
            return false
          end
        end
      end
    end
  end
end

def draw?(board)
  first_row = ([board[0],board[1],board[2]].all?{|i| (i == "X")}) || ([board[0],board[1],board[2]].all?{|i| (i == "O")})
  diagonal1 = ([board[0],board[4],board[8]].all?{|i| (i == "X")}) || ([board[0],board[4],board[8]].all?{|i| (i == "O")})
  diagonal2 = ([board[2],board[4],board[6]].all?{|i| (i == "X")}) || ([board[2],board[4],board[6]].all?{|i| (i == "O")})
  if (first_row == true) || (diagonal1 == true) || (diagonal2 == true)
    return false #Won in the first row or diagonal
  else
    if !((board.any?{|i| (i == "")}) || (board.any?{|i| (i == " ")}))
      return true
    else
      return false
    end
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def full?(board)
  board.none?{|i| (i == "" || i == " ")}
end

def over?(board)
  if (draw?(board) == true) #|| (won?(board) != false)
    return true
  else
    if ((board.any?{|i| (i == "")}) || (board.any?{|i| (i == " ")})) #Game in progress
      return false
    else
      if (won?(board) != false)
        return true
      end
    end
  end
end

def winner(board)
  if (won?(board) != false)
    combination = won?(board)
    return board[combination.first]
  else
    if (draw?(board) == true)
      return nil
    end
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  counter = 0
  while counter < 8
    a = WIN_COMBINATIONS[counter][0]
    b = WIN_COMBINATIONS[counter][1]
    c = WIN_COMBINATIONS[counter][2]
    if board[a] == "X" &&  board[b] == "X" &&  board[c] == "X" || board[a] == "O" &&  board[b] == "O" &&  board[c] == "O"
      return WIN_COMBINATIONS[counter]
      break
      break

    end

    counter += 1
  end
return false
end


def full?(board)
  bol = true
  x = 0
  while x < 9
    if board[x] == " "
      bol = false
      return bol
      break
    end
    x+=1
  end
  return bol
  end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif full?(board) == false && won?(board) == false
    return false
  elsif  won?(board) == true
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) != false
   a = won?(board)
   b = a[0]
   if board[b] == "X"
     return "X"
   else
     return "O"
   end
  else
    return nil

  end
end

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
[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each {|win| 
  letter = ""
  win.each {|pos| 
    letter += board[pos]
  }
  temp = letter[0]
  if temp != " "
  wins = true
  letter.split("").each {|l|
    if l != temp
      wins = false
    end
    if wins === false
      break
    end
  }
  end
  if wins
    return win
  end
}
empty = true
board.each {|pos|
  if pos != " "
    empty = false
  end
}
if empty === true 
  return false
end
end

def full?(board)
  if draw?(board)
    return true
  else
   return false
  end
end

def draw?(board)
  draw = false
  won = WIN_COMBINATIONS.each {|win| 
    counter = 0
    if won?(board) === win
      break true
    end
  }
  if won.is_a?(Array)
    won = false
  end
  board.each {|pos|
    if pos === " " || won
      break draw = false
    else 
      draw = true
    end
  }
  return draw
end

def over?(board)
  if won?(board) != nil
    if draw?(board)
      return true
    elsif board[won?(board)[0]] === "X" || board[won?(board)[0]] === "O"
      return true
    else
      return false
    end
  elsif draw?(board) === true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != nil
    if board[won?(board)[0]] === "X"
      return "X"
    elsif board[won?(board)[0]] === "O"
      return "O"
    else
      return nil
    end
  end
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won? (boardArray)
  WIN_COMBINATIONS.any?{|winCombination|
    if boardArray[winCombination[0]] == "X" && boardArray[winCombination[1]] == "X" && boardArray[winCombination[2]] == "X"
      return winCombination
    end
    }
  WIN_COMBINATIONS.any?{|winCombination|
    if boardArray[winCombination[0]] == "O" && boardArray[winCombination[1]] == "O" && boardArray[winCombination[2]] == "O"
      return winCombination
    end
    }
end

def full? (boardArray)
  notFull = boardArray.include?(" ")
  if notFull == true
    return false
  else
    return true
  end
end

def draw? (boardArray)
  won = won?(boardArray)
  full = full?(boardArray)
  if won == false && full == true
    return true
  elsif won == false && full == false
    return false
  else
    return false
  end
end

def over? (boardArray)
  won = won?(boardArray)
  draw = draw?(boardArray)
  full = full?(boardArray)
  if won != false || draw == true || full == true
    return true
  else
    return false
  end
end

def winner (boardArray)
  won = won?(boardArray)
  if won != false
    return boardArray[won[0]]
  else
    return nil
  end
end

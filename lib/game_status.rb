# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
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
  WIN_COMBINATIONS.find { |win_combination|
    win_combination.all? { |win_index|
      board[win_index] == "X"
    } || win_combination.all? { |win_index|
      board[win_index] == "O"
    }
  }
end

def full?(board)
    board.all? { |elem|
        elem == "X" || elem == "O"
    }
end
  
def draw?(board)
    return true if ( !won?(board) && full?(board) )
end  

def over?(board)
    return true if ( won?(board) || draw?(board) || full?(board) )
end  

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    end
end 

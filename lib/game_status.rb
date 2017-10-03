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
  status = false

  WIN_COMBINATIONS.each do | win_index |
    win_index.each do
      i = 0
      win_array = []
      while i < 3
        puts board[win_index[i]]
        puts win_index[i]

        if board[win_index[i]] != nil || " "
          win_array.push(board[win_index[i]])
          puts "i got here #{board[win_index[i]]}"
        else
          puts "or else i got here"
          status = false
        end
      i += 1
      end
     if win_array[0] == "X" && win_array[1] == "X" && win_array[2] == "X"
       return win_index
     elsif win_array[0] == "O" && win_array[1] == "O" && win_array[2] == "O"
       return win_index
     else
       status = false
     end
    end
  end
  return status
end

def full?(board)
  if board.detect{|i| i == " "}
    return false
  else
    return true
  end

end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end

    return false
  end
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)

  if won?(board) != false
    token_array = won?(board)

    if board[token_array[0]] == "X"
      return "X"
    elsif board[token_array[0]] == "O"
      return "O"
    end
   return nil

  end

end

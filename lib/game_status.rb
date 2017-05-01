# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  #if (draw?(board))
    #return false
  #end

  WIN_COMBINATIONS.select do |p|
    win_index_1 = p[0]
    win_index_2 = p[1]
    win_index_3 = p[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]


    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return p
    end
  end
  return nil
end

def full?(board)
  WIN_COMBINATIONS.select do |p|
    win_index_1 = p[0]
    win_index_2 = p[1]
    win_index_3 = p[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]


    if (position_1 == " " || position_2 == " " || position_3 == " ")
      return false

    end
  end
  return true
end

def draw?(board)
  WIN_COMBINATIONS.select do |p|
    if p == won?(board)
      return false
    end
  end
    if (full?(board))
      return true
    elsif (!full?(board))
      return false
    end
end

def over?(board)
  if (draw?(board))
    return true
  elsif(full?(board))
    return true
  end
end

def winner(board)
  if (!draw?(board))
    w = won?(board)
      if (w == nil)
        return nil
      else
      i = w[0]
      puts i
      puts w
      return board[i]
      end
    end
end

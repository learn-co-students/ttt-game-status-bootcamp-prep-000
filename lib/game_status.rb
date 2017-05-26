
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

def won?(arr)
  if !(empty_board?(arr))
    WIN_COMBINATIONS.each do |x|

      win_index_1 = x[0]
      win_index_2 = x[1]
      win_index_3 = x[2]

      position_1 = arr[win_index_1]
      position_2 = arr[win_index_2]
      position_3 = arr[win_index_3]

      if position_taken?(arr, win_index_1) && position_taken?(arr, win_index_2)
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return x
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return x
        else
          return false
        end
      end

    end
  end
end

 def position_taken?(arr, index)
   if arr[index] == "X" || arr[index] == "O"
     return true
    else
      return false
    end
  end

def empty_board?(arr)
  counter = 0
  arr.each do |x|
    if ( x == " " || x == "" || x == nil )
      counter += 1
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end

def full?(arr)
  counter = 0

  arr.each do |x|
    if ( x == "X" || x == "O" )
      counter += 1
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end

def draw?(arr)
  if (won?(arr) == false) && (full?(arr) == true)
    return true
  elsif (full?(arr) == false) && (won?(arr) == false)
    return false
  else (won?(arr) == true)
    return false
  end
end

# returns true if the board has not been won and is full and
#false if the board is not won and the board is not full,
#and false if the board is won

def over?(arr)
  # returns true if the board has been won, is a draw, or is full
  if (won?(arr) || draw?(arr) || full?(arr))
    return true
  else
    return false
  end
end

def winner(arr)
  if won?(arr)
    win_arr = won?(arr)
    return arr[win_arr[0]]
  else
    return nil
  end
end

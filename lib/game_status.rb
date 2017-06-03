# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left col
  [1, 4, 7], #Middle col
  [2, 5, 8], #Right col
  [0, 4, 8], #Left to Right diagonal
  [2, 4, 6] #Right to Left diagonal
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    elsif win_combination == [2, 4, 6]
      return false
    end
    false
  end
end

def full?(board)
  counter = 0
  board.each do |item|
    if item == " "
      counter+=1
    end
  end
  if counter == 0
    return true
  else
    return false
  end
end

def draw?(board)
  if (full?(board)) && (won?(board) == false)
    return true
  elsif (full?(board) == false) && (won?(board) == false)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || (won?(board) != false)
    return true
  elsif (full?(board) == false) && (won?(board) == false)
    return false
  else
    return false
  end
end

def winner(board)
  win = won?(board)
  if (win != false)
    return board[win[0]]
  end
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

##################

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left vertical
  [1,4,7], #middle vertical
  [2,5,8], #right vertical
  [0,4,8], #forward diagonal
  [6,4,2]  #reverse diagonal
]

####################

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_indexes = win_combination.all?{|index| position_taken?(board, index)}
      if win_indexes === true
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return win_combination
              #winner = "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return win_combination
            #  winner = "O"

          end
        end
      end
    return false
end

#######################

def full?(board)
  board.none?{|index| index == " "}
end

######################

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

#######################

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

########################

def winner(board)
  if over?(board)
    return board[won?(board)[0]]
  end
end

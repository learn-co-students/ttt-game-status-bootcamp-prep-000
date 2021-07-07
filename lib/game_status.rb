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
  [2, 4, 6],
  [0, 4, 8]

]

def won?(board)
    returnBool = false
    WIN_COMBINATIONS.each do |combo|
      pos1 = board[combo[0]]
      pos2 = board[combo[1]]
      pos3 = board[combo[2]]
      if pos1 == pos2 && pos2 == pos3 && pos3 == pos1
        if pos1 == "X" || pos1 == "O"
           puts "Combo = #{combo}TEST"
          return combo
        end
      end
    end
    return false
  end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board)
  !won?(board)
end

def over?(board)
  won?(board) || draw?(board) && full?(board)
end

 def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

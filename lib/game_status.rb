def position_taken?(board, index) #returns true if there is a X or O at index, false if it's empty
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bot row
  [0,4,8], #\ diag
  [2,4,6],  # / diag
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8] #right col
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      if board[combination[0]] == "X" || board[combination[0]] == "O"
        return combination
      end
    end
  end
  return false
end

def full?(board)
  board.none?{|index|  index.nil? || index == " "}
end

def winner(board)
  won = won?(board)
  if won != false
    return board[won[0]]
  else
    return nil
  end
end

def draw?(board)
  full?(board) && won?(board) == false
end

def over?(board)
  draw?(board) || won?(board) != false 
end

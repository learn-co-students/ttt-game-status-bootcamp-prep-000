# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
end 

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element,index|
    if position_taken?(board,element[0]) == true
      if board[element[0]] == board[element[1]] && 
        board[element[1]] == board[element[2]]
        return WIN_COMBINATIONS[index]
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"  
  end
end

def draw?(board)
   won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_character = nil
  if won?(board).class == Array
    win_character = board[won?(board)[0]]
  end
  return win_character
end
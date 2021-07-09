# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant - constants are variable type for data that is unlikley to change, like the win condition for TIC TAC TOE
WIN_COMBINATIONS =[
[0,1,2], # Top Row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # 1st collumn
[1,4,7], # 2nd collumn
[2,5,8], # 3rd collumn
[0,4,8], # R diagonal
[2,4,6]  # L diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win,[0,1,2]
    # grab each index from the win_condiation that composes a win
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3
        if position_1 == "X" && position_2 =="X" && position_3 == "X" ||
          position_1 == "O" && position_2 =="O" && position_3 == "O"
        # position_1 == position_2 && position_1 == position_3 && position_1!=nil
        return win_combination
        end
  end
    return false
end

# def full?(board)
#   board.all? do |player|
#     player == "X" || player =="O"
#   end
# end

def full?(board)
  board.each do |i|
    if i == " "
      return false
    end
  end
    return true
    # checks whether each element on the board is empty if not return false (not empty) otherwise return true(full)
end

def draw?(board)
full?(board) && !won?(board)
# checks if the board is full and if it has been won. If its full and NOT been won then its a draw (true)
end

def over?(board)
 won?(board) || draw?(board) || full?(board)
 # checks if either the board has been won, there is a draw or the board is full. If either of these conditions are true the game is over (true)
end

def winner(board)
  if win_combination = won?(board)
    board [win_combination[0]]
  end
end

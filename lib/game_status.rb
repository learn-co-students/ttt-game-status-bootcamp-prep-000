# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
  
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
        # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
        # grab each index from the win_combination that composes a win.
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        # puts "Win_index 1: #{win_index_1}"
        # puts "Win_index 2: #{win_index_2}"
        # puts "Win_index 3: #{win_index_3}"

        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3

        # puts "position_1: #{position_1}"
        # puts "position_2: #{position_2}"
        # puts "position_3: #{position_3}"

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination # return the win_combination indexes that won.
        end
    end
    return false # If you leave in the do loop above, it forces a false return.
end

# Checks if given board array is full
def full?(board)
    counter = 0

    board.each do |i|
        if i == "X" || i == "O"
            counter += 1
        else
            return false
        end
    end

    if counter == 9
        return true
    end
end

# Checks if there is a draw
def draw?(board)
    if full?(board) && !(won?(board))
        return true
    else
        return false
    end
end

# Checks if the game is over
def over?(board)
    if draw?(board) || full?(board) || won?(board)
        return true
    else
        return false
    end
end
 
# Checks who the winner is 
def winner(board)
    WIN_COMBINATIONS.each do |win_combination|
        # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
        # grab each index from the win_combination that composes a win.
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        # puts "Win_index 1: #{win_index_1}"
        # puts "Win_index 2: #{win_index_2}"
        # puts "Win_index 3: #{win_index_3}"

        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3

        # puts "position_1: #{position_1}"
        # puts "position_2: #{position_2}"
        # puts "position_3: #{position_3}"

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return "X" # return the Token that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return "O"  # return the Token that won.
        end
    end
    return nil # If you leave in the do loop above, it forces a false return.
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # Row Wins
  [0, 1, 2],  # Top row
  [3, 4, 5],  # Middle row
  [6, 7, 8],  # Bottom Row

  # Column Wins
  [0, 3, 6],  # First Column
  [1, 4, 7],  # Second Column
  [2, 5, 8],  # Third Column

  # Diagonal Wins
  [0, 4, 8],  # Top Left to Bottom Right
  [2, 4, 6]   # Top Right to Bottom Left
]


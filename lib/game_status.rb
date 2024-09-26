#board = ["X", "", "", "X", "", "", "X", "", ""]
#board = ["X", " ", " ", "X", " ", " ", "X", " ", " "]
#board = ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
#board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

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
    if board.all? { |spot| spot.strip == ""} == false
       false
    end

    # define winning indexes
    win_index_1 = WIN_COMBINATIONS[0]
    win_index_2 = WIN_COMBINATIONS[1]
    win_index_3 = WIN_COMBINATIONS[2]
    win_index_4 = WIN_COMBINATIONS[3]
    win_index_5 = WIN_COMBINATIONS[4]
    win_index_6 = WIN_COMBINATIONS[5]
    win_index_7 = WIN_COMBINATIONS[6]
    win_index_8 = WIN_COMBINATIONS[7]

    if (board[win_index_1[0]] == "X" && board[win_index_1[1]] == "X" && board[win_index_1[2]] == "X") || (board[win_index_1[0]] == "O" && board[win_index_1[1]] == "O" && board[win_index_1[2]] == "O")
       return WIN_COMBINATIONS[0]
    elsif (board[win_index_2[0]] == "X" && board[win_index_2[1]] == "X" && board[win_index_2[2]] == "X") || (board[win_index_2[0]] == "O" && board[win_index_2[1]] == "O" && board[win_index_2[2]] == "O")
       return WIN_COMBINATIONS[1]
    elsif (board[win_index_3[0]] == "X" && board[win_index_3[1]] == "X" && board[win_index_3[2]] == "X") || (board[win_index_3[0]] == "O" && board[win_index_3[1]] == "O" && board[win_index_3[2]] == "O")
       return WIN_COMBINATIONS[2]
    elsif (board[win_index_4[0]] == "X" && board[win_index_4[1]] == "X" && board[win_index_4[2]] == "X") || (board[win_index_4[0]] == "O" && board[win_index_4[1]] == "O" && board[win_index_4[2]] == "O")
       return WIN_COMBINATIONS[3]
    elsif (board[win_index_5[0]] == "X" && board[win_index_5[1]] == "X" && board[win_index_5[2]] == "X") || (board[win_index_5[0]] == "O" && board[win_index_5[1]] == "O" && board[win_index_5[2]] == "O")
       return WIN_COMBINATIONS[4]
    elsif (board[win_index_6[0]] == "X" && board[win_index_6[1]] == "X" && board[win_index_6[2]] == "X") || (board[win_index_6[0]] == "O" && board[win_index_6[1]] == "O" && board[win_index_6[2]] == "O")
       return WIN_COMBINATIONS[5]
    elsif (board[win_index_7[0]] == "X" && board[win_index_7[1]] == "X" && board[win_index_7[2]] == "X") || (board[win_index_7[0]] == "O" && board[win_index_7[1]] == "O" && board[win_index_7[2]] == "O")
       return WIN_COMBINATIONS[6]
    elsif (board[win_index_8[0]] == "X" && board[win_index_8[1]] == "X" && board[win_index_8[2]] == "X") || (board[win_index_8[0]] == "O" && board[win_index_8[1]] == "O" && board[win_index_8[2]] == "O")
       return WIN_COMBINATIONS[7]
    else
       false
    end
end

def full?(board)
   if board.all? { |spot| spot.strip != ""} == true
      true
   else
      false
   end
end

def draw?(board)
   if full?(board) && !won?(board)
      true
   end
end

def over?(board)
   if draw?(board)
      true
   elsif full?(board) && won?(board)
      true
   elsif !full?(board) && won?(board)
      true
   else
      false
   end
end

def winner(board)
   if !won?(board) && full?(board)
      return false
   end

   if won?(board)
      win = won?(board)
      if board[win[0]] == "X"
         "X"
      elsif board[win[0]] == "O"
         "O"
      end
   end
end

#puts winner(board)

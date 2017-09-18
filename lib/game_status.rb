board = ["O", "X", "X", " ", " ", " ", " ", " ", " "]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Top-left diagonals
  [2,4,6],  # Top-right diagonals
  [0,3,6],  # left vertical
  [1,4,7],  # Middle vertical
  [2,5,8]  # Right vertical
]

def won?(board)
    falsy = false
    WIN_COMBINATIONS.each do |win|
        posw_1 = win[0];
        posw_2 = win[1];
        posw_3 = win[2];

        posb_1 = board[posw_1];
        posb_2 = board[posw_2];
        posb_3 = board[posw_3];

        if posb_1 == "X" && posb_2 == "X" && posb_3 == "X" || posb_1 == "O" && posb_2 == "O" && posb_3 == "O"
            wins = [posw_1,posw_2,posw_3]
            falsy = true
            return wins
        else
            falsy = false
    end
end
return falsy
end


def full?(board)
    board.all? do |pos|
        pos != " "
    end
end

def draw?(board)
    if won?(board) ==  false && full?(board)
        return true
    elsif won?(board) == false && full?(board) == false
        return false
    else
        return false
    end
end

def over?(board)
    if won?(board) || draw?(board)
        return true
    elsif full?(board) == false
        return false
    end
end

def winner(board)
    if won?(board) != false
        wins = []
        wins << won?(board)[0]
        wins << won?(board)[1]
        wins << won?(board)[2]
        win_X = ""
        win_O = ""
        if board[wins[0]] == "X"
            win_X = "X"
        elsif board[wins[0]] = "O"
            win_O = "O"
        end
        if win_X != ""
            return win_X
        elsif  win_O != ""
            return win_O
        end
    else
        return nil
    end
end
puts winner(board)

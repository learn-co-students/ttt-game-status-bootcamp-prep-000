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
    [0, 4, 8],
    [2, 4, 6]
]

def full?(board)
    if won?(board) || draw?(board)
        return true
    else
        return false
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |c|
        player = nil
        if board[c[0]] == " "
            next
        elsif board[c[0]] == board[c[1]] && board[c[0]] == board[c[2]]
            return c
        end
    end
    #no winning c was found
    return false
end

def draw?(board)
    if won?(board) || board.include?(" ")
        return false
    else
        return true
    end
end

def over?(board)
    if full?(board)
        return true
    else
        return false
    end
end

def winner(board)
    winner = won?(board) ? board[won?(board)[0]] : nil
    return winner
end

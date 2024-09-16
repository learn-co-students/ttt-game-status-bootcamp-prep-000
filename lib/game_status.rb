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
    WIN_COMBINATIONS.detect do |win_combination|
        if board[win_combination[0]] == board[win_combination[1]] &&
            board[win_combination[1]] == board[win_combination[2]] &&
            position_taken?(board, win_combination[0])
            win_combination
        else
            false
        end
    end
end

def full?(board)
    board.all? { |token| token == "X" || token == "O" }
end

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
    if win_combination = won?(board)
        return board[win_combination[0]]
    end
end

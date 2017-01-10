# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
    [0, 1, 2],  #top row
    [3, 4, 5],  #mid row
    [6, 7, 8],  #bottom row
    [0, 3, 6],  #left column
    [1, 4, 7],  #center column
    [2, 5, 8],  #right column
    [0, 4, 8],  #diagonal top left to bottom right
    [2, 4, 6]   #diagonal bottom left to top right
]# Define your WIN_COMBINATIONS constant

def won?(board)
    WIN_COMBINATIONS.detect do |win_combo|
        board[win_combo[0]] == board[win_combo[1]] &&
        board[win_combo[1]] == board[win_combo[2]] &&
        position_taken?(board, win_combo[0])
    end
end

def full?(board)
    board.all?{ |i| i == "X" || i == "O" }
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    draw?(board) || won?(board) || full?(board)
end

def winner(board)
    if win_combination = won?(board)
        board[win_combination[0]]
    end
end

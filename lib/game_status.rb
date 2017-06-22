# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def won?(board)
    x_positions = positions(board, 'X')
    o_positions = positions(board, 'O')
    x_winner = winning_combination(board, x_positions)
    o_winner = winning_combination(board, o_positions)
    (x_winner)? x_positions : (o_winner)? o_positions : nil
end

def full?(board)
    full_board?(board) && !won?(board)
end

def draw?(board)
    full?(board)
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
    (winning_combination(board, positions(board, 'X')))? 'X' :
    (winning_combination(board, positions(board, 'O')))? 'O' : nil
end

# helper methods

def full_board?(board)
    board.all? do |char|
        char == "X" || char == "O"
    end
end

def winning_combination(board, positions)
    WIN_COMBINATIONS.any? do |combination|
        combination.all? do |val|
            positions.include?(val)
        end
    end
end


def positions(board, char)
    positions = []
    board.each_with_index do |val, index|
        if val == char
            positions.push(index)
        end
    end
    positions
end

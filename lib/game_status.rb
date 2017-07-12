require 'pry'
# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]

def won?(board)
 win = false
 char_array = ["X","O"]

  WIN_COMBINATIONS.each do |win_index|
    char_array.each do |char|
      win = win_index.all? do |position|
        board[position] == char
      end

        if win
        return win_index
      end
    end
  end

 win
end

def full?(board)

  board_full = board.all? do |cell|
    cell == "X" || cell == "O"
  end

end

def draw? (board)

  if full?(board) && !won?(board)
    true
  end

end

def over? (board)
  if draw?(board) || won?(board)
    true
  end
end


def winner(board)

  if won?(board)
    board[won?(board)[0]]
  end

end

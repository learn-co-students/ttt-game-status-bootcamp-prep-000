# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
    false
  end
  WIN_COMBINATIONS.each do |array|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X" ||
      board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
      return array
    end
  end
if full?(board) == true
  false
 end
end

def full?(board)
  board.all? { |index| index == "X" ||"O" }
  !(board.include?(" " || nil))
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |array|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X"
      return "X"
      elsif board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
        return "O"
      end
    end
    if full?(board) == true
      false
    end
  end
def over?(board)
  if full?(board) == true
    true
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
  count = 0
  WIN_COMBINATIONS.each do |set|
    winning_combination = []
    three_set = []
    count+=1
    set.each do |index|
      winning_combination.push(index)
      three_set.push(board[index])
      if three_set == ["X","X","X"] || three_set == ["O","O","O"]
        return winning_combination
      end
    end
    if count == 8
      return false
    end
  end
end

def full?(board)
  won?(board) == false && board.none? {|i| i == " "}
end

def draw?(board)
  full?(board) == true
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    won?(board).each do |index|
      if board[index] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
end

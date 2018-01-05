# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if won?(board) == true
    return false
  elsif !full?(board) && !won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  end
end

def winner(board)
    return nil if !won?(board)
    arr = won?(board)
    x = arr[0].to_i
    if board[x] == "X"
      return "X"
    elsif board[x] == "O"
      return "O"
    else return nil
    end
end
=begin
def won?(board)
  WIN_COMBINATIONS.each do |set|
    if board.count{|n| n == "X"} < 3 && board.count{|n| n == "O"} < 3
      return false
      elsif (board[set[0]] == "X" && board[set[1]] == "X" && board[set[2]] == "X")
      return set
      elsif (board[set[0]] == "O" && board[set[1]] == "O" && board[set[2]] == "O")
      return set
    else puts "shit"
    end
  end
end
=end
def won?(board)
  killer = []
  WIN_COMBINATIONS.each do |set|
    if board.count{|n| n == "X"} < 3 && board.count{|n| n == "O"} < 3
      return false
      elsif (board[set[0]] == "X" && board[set[1]] == "X" && board[set[2]] == "X")
      return set
      elsif (board[set[0]] == "O" && board[set[1]] == "O" && board[set[2]] == "O")
      return set
    else killer << set
    end
  end
  return false if killer == WIN_COMBINATIONS
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

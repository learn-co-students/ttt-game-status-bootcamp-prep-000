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
  
def won?(board)
  exs = []
  os = []
  
  board.each_with_index do |spot, i|
    if spot == "X"
      exs << i
    elsif spot == "O"
      os << i
    end 
  end 
  
  result = []
  
  WIN_COMBINATIONS.each do |combo|
    if exs.length >= 3 && combo.all? {|num| exs.include?(num)}
      result << combo
    elsif os.length >=3 && combo.all? {|num| os.include?(num)}
      result << combo
    end  
  end 
  
  !result.empty? ? result[0] : false 
end 

def full?(board)
  board_counts = what_we_have(board)
  
  return true if board_counts[" "].nil? || draw?(board)
  
  false 
end 

def draw?(board)
  b_counts = what_we_have(board)
  
  if won?(board) != false 
    return false 
  elsif (b_counts["X"] == 4 && b_counts["O"] == 5) || (b_counts["X"] == 5 && b_counts["O"] == 4)
    return true
  end
  false 
end 

def over?(board)
  return true if won?(board) != false || draw?(board) != false 
  false 
end 

def winner(board)
  return nil if won?(board) == false 
  winner_combo = won?(board)
  
  board[winner_combo[0]]

end 

def what_we_have(board)
  counter = Hash.new(0)
  
  board.each do |elem|
    counter[elem] += 1 
  end 
  
  counter 
end 

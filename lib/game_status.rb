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
  win_combination = []
  winner = []
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0]) && position_taken?(board, combination[1]) && position_taken?(board, combination[2]) && board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
       win_combination << combination
       winner << board[combination[0]]
    end   
  end
  win_combination.length == 1 || (win_combination.length == 2 && winner[0] == winner[1])? win_combination[0] : nil
end

def full?(board)
  count = 0
  board.each.with_index do |position, index| 
    if position_taken?(board, index) 
      count += 1
    end  
  end
  count == 9 ? true : false
end

def draw?(board)
  full?(board) && won?(board) == nil
end

def over?(board)
  won?(board) != nil || draw?(board) || full?(board)
end

def winner(board)
  won?(board) != nil ? board[won?(board)[0]] : nil
end  
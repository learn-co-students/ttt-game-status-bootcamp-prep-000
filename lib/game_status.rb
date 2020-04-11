# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board) 
 win_combo(board).first
end

def win_combo(board)
  WIN_COMBINATIONS.select do |winner|
    (board[winner[0]] =="X" && board[winner[1]] == "X" && board[winner[2]] == "X") || (board[winner[0]] =="O" && board[winner[1]] == "O" && board[winner[2]] == "O")
  end
end

def full?(board)
board.none? {|i|
i == " "
}
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
 full?(board) || won?(board) || draw?(board)
end

def winner(board)
winning_board = won?(board)
if winning_board == nil
  return nil
end
winning_char = board[win_combo(board)[0][0]]
if winning_board != nil 
  return winning_char
end
end


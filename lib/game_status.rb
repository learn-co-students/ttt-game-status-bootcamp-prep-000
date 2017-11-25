# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |z|
    if board [z[0]] != " " && board [z[0]]==board [z[1]] && board [z[1]]==board [z[2]]
      return z
    end #of if statement
  end #of do loop
  return false
end #of method definition

def full?(board)
  return false if board.include?(" ")
  return true
end

def draw?(board)
  return true if !won?(board) && full?(board)
  return false
end

def over?(board)
  return true if draw?(board)
  return true if won?(board)
  return false
end

def winner(board)
  return board [won?(board) [0]] if won?(board) != false
  return nil
end
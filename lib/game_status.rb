# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8], #horizonatal wins
  [0,3,6],[1,4,7],[2,5,8], #verticle wins
  [0,4,8],[2,4,6]
]

def won?(board)
  test = []
  winner = false
  WIN_COMBINATIONS.map{|win|
      winner = win
      win.each do |a|
        test << board[a]
      end
    if test.all? {|x| x== "X"} || test.all? {|o| o == "O"}
       return winner
      elsif full?(board) == true
        winner = false
        test = []
      elsif !full?(board)
        winner = false
        test = []
      else test = []
    end
  }
  winner
end

def draw?(board)
  (!won?(board).is_a?(Array) && full?(board))
end

def over?(board)
  (draw?(board) || won?(board).is_a?(Array))
end

def winner(board)
  won?(board).is_a?(Array) ? board[won?(board)[1]] : nil
end

def full?(board)
  i = 0
  board.map.with_index{|a,index| i += position_taken?(board,index) ? 1 : 0}
  i==9
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
# Define your WIN_COMBINATIONS constant
def won?(board)
  players = ["X","O"]
  won=false

  WIN_COMBINATIONS.each do |arr|
    if board[arr[0]]=="X" || board[arr[0]]=="O"
      if board[arr[0]]==board[arr[1]] && board[arr[0]]==board[arr[2]]
        won=true
        return arr
      end

    end

  end
return won
end

def full?(board)
  return board.none?{|i| i==" " || i==""}
end

def draw?(board)
  return full?(board)==true && won?(board)==false

end

def over?(board)
  return won?(board)!=false || full?(board)==true

end

def winner(board)
winarr=[]
  if over?(board) && !draw?(board)
    winarr=won?(board)
    return board[winarr[0]]
  else
    return nil
  end
end

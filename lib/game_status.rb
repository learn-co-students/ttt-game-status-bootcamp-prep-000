# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#note that a constant in Ruby, simply starts with a capital letter.
WIN_COMBINATIONS =
  [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], #bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    # ETC, an array for each win combination
  ]


  def won?(board)
  #8 winning combinations we can access each at WIN_COMBINATIONS[0] - WIN_COMBINATIONS[7]
  i=0
  8.times do

    if board.count == 0
      return false
    end

  if board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][1]] && board[WIN_COMBINATIONS[i][1]] == board [WIN_COMBINATIONS[i][2]] &&
    board[WIN_COMBINATIONS[i][0]] != " "


    return WIN_COMBINATIONS[i]

  end

  i+=1

  end

  return false

  end


  def full?(board)
    i = 0
    9.times do
      if board[i] == " "
        return false
      end
      i+=1
    end
    return true
  end


  def draw?(board)
    if full?(board) && won?(board) == true
      return false
    end

    if full?(board) && won?(board) == false
      return true
    end
  end




def over?(board)
  if draw?(board) == true
    return true
  end

if full?(board) && won?(board)
  return true
end

if won?(board)
  return true
end

end



def winner(board)

if  won?(board)!= false
   return board[won?(board)[0]] #this will return WIN_COMBINATIONS[i]
 end

   if won?(board)== false && over?(board) == true
     return nil
   end

end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #TOP row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Topleft diagonal
  [2,4,6], #Topright diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == 'X' && board[combination[1]] == 'X' && board[combination[2]] == 'X' || 
    board[combination[0]] == 'O' && board[combination[1]] == 'O' && board[combination[2]] == 'O'
  end
end

def full?(board)
  board.all? do |empty| 
    empty != " "
  end
end

def draw?(board)
    if full?(board) && !won?(board)
      puts "It is a draw!"
      return true
    end
end

def over?(board)
    if full?(board) || won?(board) || draw?(board)
      puts "Game Over!"
      return true
    end
end

def winner(board)
  if won?(board)  
      if WIN_COMBINATIONS.detect {|combination| board[combination[0]] == 'X' && board[combination[1]] == 'X' && board[combination[2]] == 'X'}
        return 'X'
      else
        return 'O'
      end
  else
  return nil
  end
end
 

      
    

  
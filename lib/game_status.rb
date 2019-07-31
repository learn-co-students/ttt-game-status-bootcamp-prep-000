# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #bottom row 
  [0, 3, 6], #left column
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8], #Diagonal1
  [6, 4, 2]  #Diagonal2
]

def won?(board)
  WIN_COMBINATIONS.each do |combo| 
    win_1 = combo[0]
    win_2 = combo[1]
    win_3 = combo[2]
    
    position_1 = board[win_1]
    position_2 = board[win_2]
    position_3 = board[win_3]
    
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_1)
        return combo
    end 
  end 
   false || nil
end 

def full?(board)
 !board.any?{ |ele| ele == " " } 
end 

def draw?(board)
 if won?(board)
   false 
 else
  full?(board)
 end 
end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  res = won?(board)
  
  if res
     board[res[0]]
  else
    false || nil 
  end
end 


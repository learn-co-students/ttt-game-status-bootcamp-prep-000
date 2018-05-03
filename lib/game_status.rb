# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define WIN_COMBINATIONS constant

WIN_COMBINATIONS=[
    [0,1,2], #Top row
    [3,4,5], #Middle
    [6,7,8], #Bottom
    [0,4,8], #diagonal Top left
    [0,3,6], #horizontal row 1
    [1,4,7], #horizontal row 2
    [2,5,8], #horizontal row 3
    [2,4,6]  #diagonal top right
]

def won?(board)
        WIN_COMBINATIONS.detect do |win_combination|             
        combo_1 = win_combination[0]
        combo_2 = win_combination[1]
        combo_3 = win_combination[2]        

        position_1 = board[combo_1] # load the value of the board at combo_1
        position_2 = board[combo_2] # load the value of the board at combo_2
        position_3 = board[combo_3] # load the value of the board at combo_3
        
        if position_1=="X" && position_2 =="X" && position_3== "X"
            return win_combination                
        elsif position_1=="O" && position_2 =="O" && position_3== "O"
            return win_combination
        else
            false
        end
    end
end    


def full?(board)
    board.all? {|occupied| !(occupied.nil? || occupied == " ")}
end


def draw?(board)
    #should be a draw if board is full and noone has won
     full?(board) && !won?(board)       
end


def over?(board)
    #should be over if board is full, is a draw, and/or has a winner.
    full?(board) || won?(board)
end

def winner(board)
    if won?(board)
        winning_player=won?(board).first
        return board[winning_player]      
    end
end
    

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]
#  WIN_COMBINATIONS = [  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    if board[win_index_1]=="X" && board[win_index_2]=="X" && board[win_index_3]=="X"
       #return win_combination
       win_combination=win_combination
       #puts"#{win_combination}"
     elsif board[win_index_1]=="O" && board[win_index_2]=="O" && board[win_index_3]=="O"
       #return win_combination
       win_combination=win_combination
       #puts"#{win_combination}"
       #return win_combination
     else false#win_combination=false
     end

                      end
#win_combination=win_combination
#return win_combination
#puts"#{win_combination}"
end
################### won?(bord) using .each do methode ########################################
#       def won?(board)
#       #WIN_COMBINATIONS = [  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]

#         WIN_COMBINATIONS.each do |win_combination|
#           win_index_1=win_combination[0]
#           win_index_2=win_combination[1]
#           win_index_3=win_combination[2]
#           #puts"#{win_index_1} , #{win_index_2} , #{win_index_3}"
#           if board[win_index_1]=="X" && board[win_index_2]=="X" && board[win_index_3]=="X"
#              #win_combination=win_combination
#              #puts"#{win_combination}"
#              return win_combination
#            elsif board[win_index_1]=="O" && board[win_index_2]=="O" && board[win_index_3]=="O"
#              #win_combination=win_combination
#              #puts"#{win_combination}"
#               return win_combination
#            #else false
#            #return false
#          end
#            #win_combination=win_combination
#                             end
#        return false
#       #return win_combination
#       #win_combination=win_combination
#       #puts "#{win_combination}"
#    end
########################################################################################################################
def full?(board)
  #####################  .each method with most frequent method with it ;return #####
#   board.each do |var|
#     if var!=" "
#        true
#     elsif var==" "
#     return false
#     end
#             end
  ######################
#    board.each do |var|
#    if var==" "
#     #false
#     return false
#     #elsif var!=" "
#     #true
#     #return true
#     end
#               end
#  return true

  ###################### .all? method with 3 ways to write it #################
#  board.all? do |var|
#    if var!=" "
#       true
#    else  false
#    end
#            end
  ################################
#         board.all? do |var|
#                    var!=" "
#                    end
  ################################
  board.all?{|var| var!=" "}

  ########### using of .any?  and .none? methods ###################################
#!(board.any?{|var| var==" "})
#board.none?{|var| var==" "}

end
####################################################################################

def draw?(board) ###### like fuzzbuzz
   if full?(board) && !won?(board)
      true
   elsif full?(board) && won?(board)
      false
   elsif !full?(board) && won?(board)
      false
 end
end
#####################################################################################

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  elsif !full?(board)
    false
  end
end
  ######################
#def over?(board)
#  if won?(board) && (draw?(board)||full?(board))
#    true
#  elsif draw?(board)
#    true
#  end
#end
#####################################################################################

def winner(board)
  #win_combination=won?(board)
  #if win_combination==false
  #  return nil
  if !won?(board)
     #return nil
     nil
    else
       win_combination=won?(board)

     index1=win_combination[0]
     index2=win_combination[1]
     index3=win_combination[2]
     if board[index1]=="X"&&board[index2]=="X"&&board[index1]=="X" #&& over?(board)
       #return "X"
        "X"
     elsif  board[index1]=="O"&&board[index2]=="O"&&board[index1]=="O" #&& over?(board)
            #return "O"
            "O"
      end
    end
end

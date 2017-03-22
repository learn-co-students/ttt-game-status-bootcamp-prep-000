# POSSIBLE ALTERNATIVE?
# WIN_COMBINATIONS = [
#   # could be library/dictionary row: [0,1,2],..
#   [# row -- WIN_COMBINATIONS[0] (W_C[0])
#     [0,1,2], # Top -- W_C[0][0]
#     [3,4,5], # Middle -- W_C[0][1]
#     [6,7,8] # Bottom -- W_C[0][2]
#   ],
#   [# column -- WIN_COMBINATIONS[1]
#     [0,3,6], # Left -- W_C[1][0]
#     [1,4,7], # Middle -- W_C[1][1]
#     [2,5,8] # Right -- W_C[1][2]
#   ],
#   [# diagonal -- WIN_COMBINATIONS[2]
#     [0,4,8], # \ -- W_C[2][0]
#     [6,4,2] # / -- W_C[2][1]
#   ]
# ]
#
# def won?(board)
#   # split into row, column, diagonal
#   WIN_COMBINATIONS.each do |combo_types|
#     # to 3 element arrays
#     combo_type.each do |win_combos|
#       # check team value of player_change
#       win_combos do |team|
#         if !win_combos[team].all? == "X"||"O"
#           false
#         else
#           puts win_combos
#         end
#       end
#     end
#   end
# end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    # win index, calm down.
    windex_1 = win_combo[0]
    windex_2 = win_combo[1]
    windex_3 = win_combo[2]
    # setup position placeholder to compare arrays
    position_1 = board[windex_1]
    position_2 = board[windex_2]
    position_3 = board[windex_3]
    # check positions for all "X" or all "O"
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combo
    end
  end
end

def full?(board)
  board.all?{|symbol| symbol == "X" || symbol == "O"} ? true : false
end

def scratch?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || scratch?(board) || full?(board)
end

def winner(board)
  # if
    won?(board) ? board[won?(board)[0]] : nil
  # else
  #   nil
  # end
end

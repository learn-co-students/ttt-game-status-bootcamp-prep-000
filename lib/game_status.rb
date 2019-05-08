# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

top_row_win = [0,1,2]
midde_row_win = [3,4,5]
bottom_row_win = [6,7,8]
first_clm_win = [0,3,6]
second_clm_win = [1,4,7]
third_clm_win = [2,5,8]
first_diag_win = [0,4,8]
second_diag_win = [2,4,6]

WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8]
]


if    board[top_row_win[0]] == "X" &&
      board[top_row_win[1]] == "X" && 
      board[top_row_win[2]] == "X"
      "X won in the top row"
elsif board[middle_row_win[0]] == "X" &&
      board[middle_row_win[1]] == "X" && 
      board[middle_row_win[2]] == "X"
      "X won in the middle row"
elsif board[bottom_row_win[0]] == "X" &&
      board[bottom_row_win[1]] == "X" && 
      board[bottom_row_win[2]] == "X"
      "X won in the bottom row"
elsif board[first_clm_win[0]] == "X" &&
      board[first_clm_win[1]] == "X" && 
      board[first_clm_win[2]] == "X"
      "X won in the first column"
elsif board[second_clm_win[0]] == "X" &&
      board[second_clm_win[1]] == "X" && 
      board[second_clm_win[2]] == "X"
      "X won in the second column"
elsif board[third_clm_win[0]] == "X" &&
      board[third_clm_win[1]] == "X" && 
      board[third_clm_win[2]] == "X"
      "X won in the third column"
elsif board[first_diag_win[0]] == "X" &&
      board[first_diag_win[1]] == "X" && 
      board[first_diag_win[2]] == "X"
      "X won diagonally"
elsif board[second_diag_win[0]] == "X" &&
      board[second_diag_win[1]] == "X" && 
      board[second_diag_win[2]] == "X"
      "X won diagonally"
end
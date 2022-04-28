class Player
  def initialize
    @board = Board.new
    print "What's Your Name?\n"
    @name = gets.chomp
    print "Enter a letter to represent your 'O' or 'X'\n"
    @chess_symbol = gets.chomp
  end

  def player_move
    move = gets.chomp 
  end
end

class Board
  def initialize
    @a = 'a'
    @b = 'b'
    @c = 'c'
    @d = 'd'
    @e = 'e'
    @f = 'f'
    @g = 'g'
    @h = 'h'
    @i = 'i'
  end

  def display_board
    puts "#{@a}|#{@b}|#{@c}\n#{@d}|#{@e}|#{@f}\n#{@g}|#{@h}|#{@i}"
  end
end

# create player 1
# ask for name
# ask for chess symbol OR choose "O" or "X"
# Repeat above steps for player 2
# create a board to play
# announce that player 1 will start first 

# loop {
#   player_move {
# player 1 input where he wants to put the chess
# board updates
# check for winning status (if abc, adg, etc. has the same value)
# announce #{name} wins
# }
# }
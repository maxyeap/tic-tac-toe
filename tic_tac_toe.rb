class Player
  def initialize
    @board = Board.new
    print "What's Your Name?\n"
    @name = gets.chomp
    print "Enter a letter to represent your 'O' or 'X'\n"
    @chess_symbol = gets.chomp
  end

  def player_move
    @board.display_board
    print "#{@name}, Choose where you want to put\n"
    move = gets.chomp
    @board.instance_variables.map {|test|
      if @board.instance_variable_get(test) == move
        @board.instance_variable_set(test, @chess_symbol)
      end
    }
    @board.display_board
  end
end

class Board
  attr_accessor :a, :b, :c, :d, :e, :f, :g, :h, :i

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

player_1 = Player.new
player_2 = Player.new

i = 0
while i < 9
  player_1.player_move
  player_2.player_move
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

#Create Player 1 and 2 in just one instance(initialization)
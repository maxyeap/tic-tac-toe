class Player
  def initialize
    @board = Board.new

    print "Player 1, please input your name\n"

    @player1_name = gets.chomp

    print "Player 2, please input your name\n"

    @player2_name = gets.chomp
  end

  def player_symbol
    print "#{@player1_name}, please choose between 'O' or 'X'\n"

    @player1_symbol = gets.chomp

    @player2_symbol = ''

    if @player1_symbol == 'O'
      @player2_symbol = 'X'
      print "#{@player2_symbol}, your symbol is 'X'\n"
    else
      @player2_symbol = 'O'
      print "#{@player2_symbol}, your symbol is 'O'\n"
    end
  end

  def player_move (player_name, symbol)
    @board.display_board

    print "#{player_name}, Choose where you want to put\n"

    move = gets.chomp

    @board.instance_variables.map { |test|
      if @board.instance_variable_get(test) == move
        @board.instance_variable_set(test, symbol)
      end
    }
  end

  def start_game
    i = 0

    while i < 5
      player_move(@player1_name, @player1_symbol)
      @board.check_for_win(@player1_name)
      player_move(@player2_name, @player2_symbol)
      @board.check_for_win(@player2_name)
      i += 1
    end
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

  def check_for_win(player)
    array = [
      [@a, @b, @c], [@a, @d, @g], [@b, @e, @h], [@c, @f, @i],
      [@d, @e, @f], [@g, @h, @i], [@g, @e, @c], [@a, @e, @i]
    ]
    array.each { |combination|
      if combination.uniq.length == 1
        print "#{player} Win!"
        exit
      end
    }
  end
end

players = Player.new
players.player_symbol
players.start_game





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

# Create Player 1 and 2 in just one instance(initialization)

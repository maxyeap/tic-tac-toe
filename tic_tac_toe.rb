class Player
  attr_accessor :board

  def initialize
    print "Player 1, please input your name\n"

    @player1_name = gets.chomp

    print "Player 2, please input your name\n"

    @player2_name = gets.chomp
  end

  def player_marker
    print "#{@player1_name}, please choose between 'O' or 'X'\n"

    @player1_marker = gets.chomp

    @player2_marker = ''

    if @player1_marker == 'O'
      @player2_marker = 'X'
      print "#{@player2_name}, your symbol is 'X'\n"
    else
      @player2_marker = 'O'
      print "#{@player2_name}, your symbol is 'O'\n"
    end
  end

  def player_move (player_name, symbol)
    Grid.display_grid

    print "#{player_name}, Choose where you want to put\n"

    move = gets.chomp

    Grid.instance_variables.map { |test|
      if Grid.instance_variable_get(test) == move
        Grid.instance_variable_set(test, symbol)
      end
    }
  end

  def start_game
    i = 0

    while i < 5
      player_move(@player1_name, @player1_marker)
      Grid.check_for_win(@player1_name)
      player_move(@player2_name, @player2_marker)
      Grid.check_for_win(@player2_name)
      i += 1
    end
  end
end

class Grid
  @a = 'a'
  @b = 'b'
  @c = 'c'
  @d = 'd'
  @e = 'e'
  @f = 'f'
  @g = 'g'
  @h = 'h'
  @i = 'i'

  class << self
    attr_accessor :a, :b, :c, :d, :e, :f, :g, :h, :i
  end

  def self.display_grid
    puts "\n#{@a}|#{@b}|#{@c}\n#{@d}|#{@e}|#{@f}\n#{@g}|#{@h}|#{@i}"
  end

  def self.check_for_win(player)
    array = [
      [@a, @b, @c], [@a, @d, @g], [@b, @e, @h], [@c, @f, @i],
      [@d, @e, @f], [@g, @h, @i], [@g, @e, @c], [@a, @e, @i]
    ]

    array.each { |combination|
      if combination.uniq.length == 1
        self.display_grid
        print "#{player} Win!"
        exit
      end
    }
  end
end

players = Player.new
players.player_marker
players.start_game





# # create player 1
# # ask for name
# # ask for chess symbol OR choose "O" or "X"
# # Repeat above steps for player 2
# # create a board to play
# # announce that player 1 will start first

# # loop {
# #   player_move {
# # player 1 input where he wants to put the chess
# # board updates
# # check for winning status (if abc, adg, etc. has the same value)
# # announce #{name} wins
# # }
# # }

# # Create Player 1 and 2 in just one instance(initialization)

# # Change display board or board class into class method

# # Player 1 Name
# player_1 = player.new
# print input name
# player_name = gets
# print [player_name] input name
# player_marker = gets

# # Display the grid
# display_grid
# # Player 1 Move
# player1.move(1)
# if variable.value contains 1 then variable = player_marker
# Grid.display_grid

# player_1.check_for_win
# # Check for win
# if combination == true then Grid.display_grid and announce player_name win
# # Display the grid
# # Player 2 Move
# # Check for win

# # Grid Class - Use class variables instead of instance variable. Don't create new instance for this class.

# frozen_string_literal: true
require 'colorize'

# Get the values of each of the variables in the Grid
module ValuesArray
  def current_values_array (grid)
    grid.instance_variables.map { |value| grid.instance_variable_get(value) }
  end
end

# This class represents the players of the tic-tac-toe game
class Player
  include ValuesArray

  attr_reader :marker

  @current_number_of_players = 0

    class << self
      attr_accessor :current_number_of_players
    end

  def initialize (game, marker)
    Player.current_number_of_players += 1
    @game = game
    @marker = marker
    puts "Player #{Player.current_number_of_players}, please input your name", "(Alphabets and Numbers only)"
    @name = gets.chomp.gsub(/[^0-9A-Za-z]/, '')
  end

  def to_s
    "#{@name}"
  end
end

# This class represents the grid that the tic-tac-toe game is going to be played on
class Grid
  include ValuesArray
  attr_reader :a, :b, :c, :d, :e, :f, :g, :h, :i

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

  def display
    puts "#{@a} | #{@b} | #{@c}\n--+---+--\n#{@d} | #{@e} | #{@f}\n--+---+--\n#{@g} | #{@h} | #{@i}"
  end
end

class Game
  include ValuesArray

  def initialize(player_1_class, player_2_class)
    @players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")].shuffle
    @grid = Grid.new
    @current_player_index = 0
    puts "#{current_player} (#{current_player.marker}) goes first."
  end

  def current_player
    @players[@current_player_index]
  end

  def other_player_index
    1 - @current_player_index
  end

  def switch_players!
    @current_player_index = other_player_index
  end

  def start_game
    loop do
      player_move(current_player)
      
      if check_for_win?(current_player)
        @grid.display
        puts "#{current_player} is the winner!".green
        exit

      elsif check_for_draw?
        @grid.display
        puts "It's a draw!"
        exit
      end

      switch_players!
    end
  end

  def player_move(player)
    @grid.display

    puts "#{player}(#{player.marker}), please mark your move by inputting one of the letters from the grid"

    move = gets.chomp.downcase

    # Check for exception in user input
    if current_values_array(@grid).include?(move) == false
      puts 'Input is not valid. Please try again.'.red
      player_move(player)
    end

    @grid.instance_variables.map do |value| 
      if @grid.instance_variable_get(value) == move
        @grid.instance_variable_set(value, player.marker)
      end
    end

    def check_for_win?(player)
      winning_combinations = [[@grid.a, @grid.b, @grid.c], [@grid.a, @grid.d, @grid.g], [@grid.b, @grid.e, @grid.h], [@grid.c, @grid.f, @grid.i],
               [@grid.d, @grid.e, @grid.f], [@grid.g, @grid.h, @grid.i], [@grid.g, @grid.e, @grid.c], [@grid.a, @grid.e, @grid.i]]
  
      winning_combinations.any? do |combination|
        combination.all? { |elem| elem == player.marker }
      end
    end
  
    def check_for_draw?
      default_values_array = ("a".."i").to_a
      (current_values_array(@grid) - default_values_array).length == 9
    end
  end

  # this is a higher level class composed of other objects
  # the dependencies exist upfront in the constructor
  # it can talk to the players and the board through invoking their methods
end

Game.new(Player, Player).start_game
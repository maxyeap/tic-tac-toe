# frozen_string_literal: true

require 'colorize'

# Get the values of each of the variables in the Grid
module ValuesArray
  def current_values_array
    Grid.instance_variables.map { |value| Grid.instance_variable_get(value) }
  end
end

# This class represents the players of the tic-tac-toe game
class Players
  include ValuesArray

  def initialize
    @player1_marker = ''

    @player2_marker = ''

    puts 'Player 1, please input your name', '(Alphabets only. Special characters will be removed)'.light_black

    @player1_name = gets.chomp.gsub(/[^0-9A-Za-z]/, '')

    puts 'Player 2, please input your name', '(Alphabets only. Special characters will be removed)'.light_black

    @player2_name = gets.chomp.gsub(/[^0-9A-Za-z]/, '')
  end

  def start_game
    player1_marker_set
    player2_marker_set

    loop do
      player_move(@player1_name, @player1_marker)
      Grid.check_for_win(@player1_name, @player1_marker)
      player_move(@player2_name, @player2_marker)
      Grid.check_for_win(@player2_name, @player2_marker)
    end
  end

  private

  def player1_marker_set
    puts "#{@player1_name}, please input 'O' or 'X' to select your marker"

    @player1_marker = gets.chomp.upcase

    player1_marker_check_exception
  end

  def player1_marker_check_exception
    begin
      raise 'Input is not valid. Please try again.'.red if (@player1_marker != 'O') && (@player1_marker != 'X')

    rescue => e
      puts e.to_s.red
      player1_marker_set
    end
  end

  def player2_marker_set
    if @player1_marker == 'O'
      @player2_marker = 'X'
      puts "#{@player2_name}, your marker is 'X'"
    else
      @player2_marker = 'O'
      puts "#{@player2_name}, your marker is 'O'"
    end
  end

  def player_move (player_name, marker)
    Grid.display

    puts "#{player_name}(#{marker}), please mark your move by inputting one of the letters from the grid"

    move = gets.chomp.downcase

    # Check for exception in user input
    if current_values_array.include?(move) == false
      puts 'Input is not valid. Please try again.'.red
      player_move(player_name, marker)
    end

    Grid.instance_variables.map do |value| 
      if Grid.instance_variable_get(value) == move
        Grid.instance_variable_set(value, marker)
      end
    end
  end
end

# This class represents the grid that the tic-tac-toe game is going to be played on
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
    include ValuesArray
    attr_reader :a, :b, :c, :d, :e, :f, :g, :h, :i
  end

  def self.display
    puts "#{@a} | #{@b} | #{@c}\n--+---+--\n#{@d} | #{@e} | #{@f}\n--+---+--\n#{@g} | #{@h} | #{@i}"
  end

  def self.check_for_win(player_name, marker)
    array = [[@a, @b, @c], [@a, @d, @g], [@b, @e, @h], [@c, @f, @i],
             [@d, @e, @f], [@g, @h, @i], [@g, @e, @c], [@a, @e, @i]]

    default_values_array = ("a".."i").to_a

    array.each do |combination|
      if combination.uniq.length == 1
        display
        puts "#{player_name}(#{marker}) is the winner!".green
        exit

      elsif (current_values_array - default_values_array).length == 9
        display
        puts "It's a draw!"
        exit
      end
    end
  end
end

players = Players.new
players.start_game

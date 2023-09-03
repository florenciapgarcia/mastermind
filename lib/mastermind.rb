# frozen_string_literal: true

require 'highline'
require 'pastel'
require_relative 'rules'
require_relative 'player'
require_relative 'board'

class Mastermind
  include Rules

  attr_accessor :colours_array, :game_over, :player, :board, :highline

  def initialize(player = Player.new, board = Board.new, colours_array = randomly_choose_colours)
    @cli = HighLine.new
    @pastel = Pastel.new
    @player = player
    @colours_array = colours_array
    @game_over = false
    @board = board
  end

  # def print
  #   puts 'ARRAY: ', @colours_array
  #   puts is_it_right_colour?(@colours_array, 'yellow')
  #   red = @pastel.red.clear.detach
  #   puts red.call(peg_colour(@colours_array, 'yellow', 1))
  # end

  def play_game
    until game_over
      # show game rules to player
      game_rules
      # N_OF_GUESSES.times do
      #
      ask_player_input
      @game_over = winner?(colours_array, player.pegs_colours)
      # puts @colours_array
      # @board.display(@player.moves)
      player.reset_pegs_colours
      # break if @game_over
      break
      # end
    end
  end

  def game_rules
    @cli.say 'Welcome to Mastermind. You need to guess the right colour and position for the secret code.'
    @cli.say "The available colours are: #{@pastel.bright_white.bold('WHITE')}, #{@pastel.bright_black.bold('BLACK')}, #{@pastel.bright_red.bold('RED')}, #{@pastel.bright_yellow.bold('YELLOW')}, #{@pastel.bright_cyan.bold('BLUE')}, #{@pastel.bright_green.bold('GREEN')}."
    @cli.say 'You have 10 guesses to get the right colour in the right position.'
    @cli.say "* You will see the word #{@pastel.bright_white.underline('WHITE')} for every colour you get right but in the wrong position,"
    @cli.say "* and the word #{@pastel.bright_black.underline('BLACK')} if you get both colour and position right."
    @cli.say "* You will see the word #{@pastel.magenta.underline('NONE')} if you've got none right."
    @cli.say "#{@pastel.bright_green.bold("Let's play....")}"

    @cli.say "#{@pastel.blue.underline.bold(player.name)}, please enter the colours in the order you believe they are in!"
  end

  def ask_player_input
    4.times do |i|
      colour = @cli.ask "Colour ##{i + 1}. Input a colour and press enter" do |q|
        q.validate = /^(blue|green|white|black|red|yellow)$/i
        q.responses[:not_valid] =
          'Invalid input. Please enter a valid colour: blue, green, white, black, red, yellow!'
      end

      player.save_pegs_colours(peg_colour(colours_array, colour, i)) if colour
    end
  end
end

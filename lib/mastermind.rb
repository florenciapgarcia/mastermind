# frozen_string_literal: true

require_relative 'rules'

class Mastermind
  include Rules

  attr_accessor :colours_array

  def initialize
    @colours_array = randomly_choose_colours
  end

  # is_it_right_colour?(@algo)
  def print
    puts 'ARRAY: ', @colours_array
    puts is_it_right_colour?(@colours_array, 'yellow')
    puts peg_colour(@colours_array, 'yellow', 1)
  end

  # when game initializes it does with a guesses array and at first this array will be chosen at random
end
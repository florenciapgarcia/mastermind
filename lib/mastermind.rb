# frozen_string_literal: true

require_relative 'rules'

class Mastermind
  include Rules

  attr_accessor :algo

  def initialize
    super
    @algo = randomly_choose_colours
  end

  # is_it_right_colour?(@algo)
  def print
    puts 'ARRAY: ', @algo
    puts is_it_right_colour?(@algo, 'yellow')
    puts is_it_right_position_and_colour?(@algo, 'yellow', 2)
  end

  # when game initializes it does with a guesses array and at first this array will be chosen at random
end
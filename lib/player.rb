# frozen_string_literal: true

require 'highline'
require_relative './board'

class Player
  attr_accessor :name, :pegs_colours, :correct_guesses

  @@total_players = []

  def initialize(name = nil, pegs_colours = [], correct_guesses = [])
    @cli = HighLine.new
    @name = name || ask_for_name
    @pegs_colours = pegs_colours
    @correct_guesses = correct_guesses
    @@total_players << self
  end

  def save_pegs_colours(position)
    @pegs_colours << position
  end

  def reset_pegs_colours
    @pegs_colours = []
  end

  def self.total_players
    @@total_players
  end

  private

  def ask_for_name
    cli = HighLine.new
    cli.ask('Please enter your name').capitalize
  end
end

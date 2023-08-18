# frozen_string_literal: true
require 'highline'

require_relative './board'


class Player
  attr_accessor :name, :correct_guesses
  @@total_players = []
  def initialize
    @cli = HighLine.new
    name = @cli.ask 'Please enter your name'
    @name = name.capitalize
    @moves = []
    @correct_guesses = []
    @@total_players << self
  end

  def update_moves(position)
    @moves << position
  end

  def self.total_players
    @@total_players
  end
end

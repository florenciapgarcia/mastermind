# frozen_string_literal: true

require_relative './board'

class Player
  attr_accessor :name, :correct_guesses
  @@total_players = []
  def initialize
    puts 'Please enter your name'
    name = gets.chomp
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

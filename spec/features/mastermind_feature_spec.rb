# frozen_string_literal: true

require 'mastermind'
require 'player'
require_relative '../spec_helper'
require 'rspec/core'
require 'rspec/mocks'
require 'stringio'

RSpec.describe 'Mastermind game' do
  let(:player) { Player.new('Player') }
  let(:board) { Board.new }
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:highline) { HighLine.new(input, output) }
  let(:input_data) { %w[blue green white black] }
  let(:mastermind) { Mastermind.new(player, board, input_data) }

  before do
    allow(HighLine).to receive(:new).and_return(highline)
  end

  context 'when user starts playing game' do
    before { mastermind.game_rules }

    it 'displays game rules to player' do
      expect(output.string).to include('Welcome to Mastermind. You need to guess the right colour and position for the secret code.')
      expect(output.string).to include('The available colours are:')
      expect(output.string).to include("Let's play...")
    end

    it 'displays the user\'s name' do
      expect(output.string).to include('Player')
    end
  end

  context 'and is prompted to input a colour' do
    it 'displays instructions to user' do
      input.puts(input_data.join("\n"))
      input.rewind

      allow(player).to receive(:save_pegs_colours)

      mastermind.ask_player_input

      expect(output.string).to include('Colour #1. Input a colour and press enter')
      expect(output.string).to include('Colour #2. Input a colour and press enter')
      expect(output.string).to include('Colour #3. Input a colour and press enter')
      expect(output.string).to include('Colour #4. Input a colour and press enter')

      expect(player).to have_received(:save_pegs_colours).exactly(4).times
    end
  end

  context 'when user enters permitted colours' do
    context 'when only some guesses are right' do
      it 'saves black and white pegs' do
        guesses = %w[white green yellow red]
        allow_any_instance_of(HighLine).to receive(:ask).and_return(*guesses)

        mastermind.ask_player_input

        expect(player.pegs_colours).to eq(%w[white black none none])
      end
    end

    context 'when the guesses are perfect' do
      it 'saves all black pegs' do
        allow_any_instance_of(HighLine).to receive(:ask).and_return(*input_data)

        mastermind.ask_player_input

        expect(player.pegs_colours).to eq(%w[black black black black])
      end
    end
  end

  context 'when users guesses are perfect' do
    it 'is game over' do
      allow_any_instance_of(HighLine).to receive(:ask).and_return(*input_data)

      mastermind.play_game

      expect(mastermind.game_over).to eq(true)
    end
  end

  context 'when user guesses are not perfect' do
    it 'keeps prompting the user for guesses' do
      guesses = [%w[red yellow white blue], %w[green yellow red black],
                 %w[black yellow red white], %w[green yellow red blue], %w[blue white white black]]
      allow_any_instance_of(HighLine).to receive(:ask).and_return(**guesses)
      guesses.each do |guess|
          puts each
      end
      #  allow_any_instance_of(Mastermind).to receive(:puts) do |_, message|
      #         output ||= ""
      #         output << message
      #       end
      mastermind.play_game

      guesses.each_with_index do |guess, index|
        input.puts(guess)
        input.rewind

        # expect(mastermind).to receive(:puts).with("Colour ##{index + 1}. Input a colour and press enter")
        expect(output.string).to include("Colour ##{index + 1}. Input a colour and press enter")
      end
      expect(mastermind).to receive(:ask_player_input).at_most(10).times

      # expect(player.colour_pegs).to eq([])
      # expect(output.string).to include('Colour #1. Input a colour and press enter')
    end
  end
end

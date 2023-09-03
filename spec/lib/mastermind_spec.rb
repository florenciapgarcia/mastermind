require 'mastermind'
require 'player'
require 'board'
require 'highline'
require_relative '../spec_helper'

RSpec.describe Mastermind do
  let!(:highline) { instance_double(HighLine) }
  let!(:player) { instance_double(Player, name: 'Test') }
  let!(:colour_guesses) {['red', 'blue', 'white', 'yellow']}
  subject(:mastermind) { described_class.new(player) }

  context '#play_game' do

    # it "prompts the user for their guess" do
    #   allow_any_instance_of(HighLine).to receive(:ask).and_return("red")
    #   mastermind.ask_player_input
    #   expect(mastermind.player.pegs_colours).to eq("red")
    # end
  end

  context '#game_rules' do
    let(:captured_output) { capture_output { mastermind.game_rules } }

    it 'displays game rules to the player' do
      expect(captured_output).to include("Welcome to Mastermind. You need to guess the right colour and position for the secret code.")
      expect(captured_output).to include("The available colours are:")
      expect(captured_output).to include("Let's play...")
    end

    it 'calls players name' do
      expect(captured_output).to include(player.name)
    end

    it 'prints 8 statements in console' do
      expect_any_instance_of(HighLine).to receive(:say).exactly(8).times
      mastermind.game_rules
    end
  end

  context '#ask_player_input' do
    let(:captured_output) { capture_output { mastermind.ask_player_input } }

    it 'asks the player 4 times for their colour guess' do
      # puts 'CAPT', captured_output

      # expect_any_instance_of(HighLine).to receive(:ask).exactly(4).times

      expect_any_instance_of(HighLine).to receive(:ask).with("Colour #1. Input a colour and press enter").and_return('blue')
      # expect(highline).to receive(:ask).with("Colour #2. Input a colour and press enter").and_return('red')

      mastermind.ask_player_input
    end
      # context 'when the user enters an invalid colour' do
      #   it 'displays an error message' do
      #     # allow(HighLine).to receive(:ask).and_return('purple', 'blue', 'green', 'red')
      #     allow_any_instance_of(HighLine).to receive(:ask).and_return('input_1', 'input_2', 'input_3', 'input_4')

      #     # expect { mastermind.play_game }.to output('Invalid input. Please enter a valid colour: blue, green, white, black, red, yellow!').to_stdout
      #     # mastermind.play_game
      #     # expect(cli).to receive(:ask).exactly.times(4)

      #     expect do
      #       mastermind.play_game
      #     end.to output('Invalid input. Please enter a valid colour: blue, green, white, black, red, yellow!').to_stdout
      #   end
    # 1. it asks player 4 times for their input
    # 2. when user replies with a colour that's not allowed,
    #   2.a. it will prompt the user to re-enter a permitted colour
    # 3. when user replies with a colour allowed,
    # 4. it will save the users guesses
  end
end

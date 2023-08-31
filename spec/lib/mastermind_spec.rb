require_relative '../../lib/mastermind'
require_relative '../../lib/player'
require_relative '../../lib/board'
require 'highline'
require 'stringio'

RSpec.describe Mastermind do
  # let(:mastermind) { Mastermind.new(player=player, colours_array=colours_array) }
  # let(:colours_array) { Rules::COLOURS[0, 4] }
  # let(:player) { instance_double(Player) }
  # let(:board) { instance_double(Board) }
  subject(:mastermind) { described_class.new }

  # context '#initialise' do
  # end

  context '#play_game' do
    it 'displays the game rules to the player' do
      # allow(mastermind).to receive(:ask_player_input)

      # Expectations
      expect(mastermind).to receive(:game_rules).once
      expect(mastermind).to receive(:ask_player_input).once # Adjust as needed
      # puts 'master,', mastermind.play_game
      # Execute the method being tested
      # mastermind.play_game
      expected_output = 'hey'
      # highline_output = StringIO.new
      # allow(HighLine).to receive(:new).and_return(HighLine.new(input: StringIO.new, output: highline_output))

      # expect { mastermind.play_game }.to output(expected_output).to_stdout

      # mastermind.play_game
      captured_output = StringIO.new
      $stdout = captured_output

      # Call the play_game method
      mastermind.play_game

      # Reset standard output
      $stdout = STDOUT

      # Rewind and read the captured output
      captured_output.rewind
      output = captured_output.readgit

      # Expectations on the captured output
      expect(output).to include('Welcome to Mastermind.')
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
    # end
  end
end

require 'rules'

RSpec.describe Rules do
  let(:game) { Class.new { extend Rules } }
  let(:guessed_colours) { ['red', 'blue', 'black', 'green'] }
  context '#is_it_right_colour?' do
    context 'when a colour included in the array is passed' do
      it 'returns true' do
        expect(game.is_it_right_colour?(guessed_colours, 'red')).to eq(true)
      end
    end

    context 'when a colour that is not included in the array of colours is passed' do
      it 'returns false' do
        expect(game.is_it_right_colour?(guessed_colours, 'yellow')).to eq(false)
      end
    end
  end

  context '#perfect_guess?' do
    context 'when the guessed position is 100% accurate' do
      it 'returns true' do
        expect(game.perfect_guess?(['red', 'blue', 'black', 'white'], 'blue', 1)).to eq(true)
      end
    end

    context 'when the guessed position is not 100% accurate' do
      it 'returns false' do
        expect(game.perfect_guess?(['red', 'blue', 'black', 'white'], 'black', 1)).to eq(false)
      end
    end
  end

  context '#peg_colour' do
    context 'when the guess is perfect' do
      it 'returns black' do
        expect(game.peg_colour(guessed_colours, 'red', 0)).to eq('black')
      end
    end

    context 'when the right colour is guessed but in the wrong position' do
      it 'returns white' do
        expect(game.peg_colour(guessed_colours, 'red', 2)).to eq('white')
      end
    end

    context 'when the guess is wrong' do
      it 'returns none' do
        expect(game.peg_colour(guessed_colours, 'yellow', 1)).to eq('none')
      end
    end
  end

  context '#winner?' do
    context 'when the 4 colour guesses are in the right position' do
      it 'returns true' do
        expect(game.winner?(['black', 'black', 'black', 'black'])).to eq(true)
      end
    end

    context 'when the 4 colour guesses are not all in the right' do
      it 'returns false' do
        expect(game.winner?(['black', 'none', 'black', 'white'])).to eq(false)
      end
    end
  end

  context '#randomly_choose_colours' do
    it 'returns an array with 4 randomly chosen colours included in the COLOURS array' do
      expect(game.randomly_choose_colours.length).to eq(4)
    end
  end
end

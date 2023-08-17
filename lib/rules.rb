module Rules
  COLOURS = ['blue', 'red', 'yellow', 'green', 'black', 'white'].freeze

  # RULE 4 - the player has 10 guesses
  n_of_guesses = 10

  # RULE 1 - The winner is the player who solves the code with fewer guesses.

  # RULE 2 - white peg: correct colour but wrong position

  # RULE 3 - black peg: correct colour and position
  def is_it_right_colour?(array, guess)
    array.include?(guess)
  end

  def is_it_right_position_and_colour?(array, colour_guess, position_guess)
    is_it_right_colour?(array, colour_guess) && array[colour_guess]
  end

  def randomly_choose_colours
    random_colours_array = []

    # to pick any random colour (that can be repeated)
    4.times do
      random_colours_array << COLOURS[rand(0..5)]
    end

    random_colours_array
  end
end

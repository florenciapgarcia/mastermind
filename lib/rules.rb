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

  def is_it_right_position?(array, colour_guess, position_guess)
    array[position_guess] == colour_guess
  end

  def perfect_guess?(array, colour_guess, position_guess)
    is_it_right_colour?(array, colour_guess) && is_it_right_position?(array, colour_guess, position_guess)
  end

  def peg_colour(array, colour_guess, position_guess)
    if perfect_guess?(array, colour_guess, position_guess)
      'black'
    elsif is_it_right_colour?(array, colour_guess)
      'white'
    else
      'none'
    end
  end

  def randomly_choose_colours
    COLOURS.sample(4)
  end
end

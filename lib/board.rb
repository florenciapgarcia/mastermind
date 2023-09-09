require 'highline'

class Board
  # Create a HighLine object
  def initialize
    @cli = HighLine.new
  end

  def display(moves)
    @cli.say 'Feedback:'
    moves.each do |move|
      print " #{move} |"
    end
    @cli.say " \n"
  end
end

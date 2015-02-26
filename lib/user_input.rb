class UserInput

  attr_accessor :evaluate

  def initialize
    @evaluate = GuessEvaluator.new
  end

  def accept_input
    gets.chomp
  end

  def parse_guess
    input = gets.chomp
    print input.split("")
  end


end

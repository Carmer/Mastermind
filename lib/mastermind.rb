require 'pry'
require_relative 'response'
require_relative 'sequence_generator'
require_relative 'menu'
require_relative 'guess_evaluator'

class Mastermind

  attr_reader :secret,
              :response

  def initialize
    @secret = SequenceGenerator.new.generate_sequence
    @response = Response.new(Hash.new)
  end

  def begin_game
    @secret
    response.begin_game
    game_loop
  end

  def game_loop
    until @response.status == :game_over || @response.status == :won
      guess = gets.chomp
      if guess[/[icq]/]
        in_game_menu
      else
        check = GuessEvaluator.new(guess, @secret)
        case
        when check.guess_correct?
          @response.winner
        when check.guess_too_short?
          @response.guess_too_short
        when check.guess_too_long?
          @response.guess_too_long
        when guess[/[rbgy]{4}/]
          @response.correct_input(check)
        else
          @response.invalid_input
        end
        if @response.response_count > 9
          @response.out_of_guesses
        end
      end
    end
  end

  def menu
    guess = gets.chomp
    case
    when    guess == ""
      @response.welcome
    when guess == "q"
      @response.quit
    when guess == "i"
      @response.instructions
    when guess == "p"
      begin_game
    when guess == "c"
      cheat
    end
  end

  def in_game_menu
    guess = gets.chomp #---> this is an issue - I can't get get the guess from above to be gotten here
    case
    when    guess == ""
      @response.what_is_your_guess
    when guess == "q"
      @response.quit
    when guess == "i"
      @response.instructions
    when guess == "p"
      begin_game
    when guess == "c"
      cheat
    end
  end


  def cheat
    print @secret
  end
end

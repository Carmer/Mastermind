require './lib/printer'
class Response
  attr_accessor :status,
                :response_count
  attr_reader   :printer

  def initialize(inputs)
      @response_count = 0
      @printer        = Printer.new
  end

  def winner(guess, response_count, total_min, total_sec)
    @status   = :won
    printer.winner(guess, response_count, total_min, total_sec)
  end

  def guess_too_short
    @status = :continue
    printer.guess_too_few_char
  end

  def guess_too_long
    @status = :continue
    printer.guess_too_many_char
  end

  def correct_input(guess, check)
    @response_count += 1
    @status  = :continue
    printer.guess_correctness(guess, check.guess_num_colors_correct, check.guess_correct_positions)
  end

  def invalid_input
    @status  = :continue
    printer.incorrect_input
  end

  def out_of_guesses
    @status  = :game_over
    printer.out_of_guesses
  end

  def quit
    @status  = :game_over
    printer.quit
  end

  def instructions
    @status  = :continue
    printer.instructions
  end

  def begin_game
    @status  = :continue
    printer.begin
  end

  def welcome
    @status  = :continue
    printer.welcome
  end

  def cheat(secret)
    @status  = :continue
    printer.cheat(secret)
  end
end

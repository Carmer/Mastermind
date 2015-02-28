require './lib/printer'
class Response
  attr_accessor :message,
                :status,
                :response_count,
                :printer

  def initialize(inputs)
    @message        = inputs[:message]
    @status         = inputs[:status]
    @response_count = 0
    @printer        = Printer.new
  end

  def winner(guess, response_count, total_min, total_sec)
    @status   = :won
    @message  = printer.winner(guess, response_count, total_min, total_sec)
  end

  def guess_too_short
    @status = :continue
    @message = printer.guess_too_few_char
  end

  def guess_too_long
    @status = :continue
    @message = printer.guess_too_many_char
  end

  def correct_input(guess, check)
    @response_count += 1
    @status  = :continue
    @message = printer.guess_correctness(guess, check.guess_num_colors_correct, check.guess_correct_positions)
  end

  def invalid_input
    @status  = :continue
    @message = printer.incorrect_input
  end

  def out_of_guesses
    @status  = :game_over
    @message = printer.out_of_guesses
  end

  def quit
    @status  = :game_over
    @message = printer.quit
  end

  def instructions
    @status  = :continue
    @message = printer.instructions
  end

  def what_is_your_guess
    @status  = :continue
    @message = printer.what_is_your_guess
  end

  def begin_game
    @status  = :continue
    @message = printer.begin
  end

  def welcome
    @status  = :continue
    @message = printer.welcome
  end

  def cheat(secret)
    @status  = :continue
    @message = printer.cheat(secret)
  end
end

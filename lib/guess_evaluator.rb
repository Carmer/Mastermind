class GuessEvaluator

  def initialize(guess , secret)
    @guess = guess.upcase.split("")
    @secret = secret
  end

  def guess_correct?
    @guess == @secret
  end

  def guess_too_short?
    @guess.size < @secret.size
  end

  def guess_too_long?
    @guess.size > @secret.size
  end

  def guess_num_colors_correct
    @guess.uniq.count do |color|
      @secret.uniq.include?(color)
    end
  end

  def guess_correct_positions
    positions = @guess.zip(@secret).count {|guess, secret| guess == secret}
  end
end

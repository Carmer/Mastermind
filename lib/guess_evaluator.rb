class GuessEvaluator


  def initialize(guess , secret)
    @guess = guess.split("")
    @secret = secret.dup
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

  def guess_num_correct
    @guess.count do |color|
      next false unless @secret.include?(color)
      @secret.delete_at(@secret.index(color))
    end
  end

  def guess_correct_positions
    positions = @guess.zip(@secret)
    positions.count do |color|
      color[0] == color[1]
    end
  end

end

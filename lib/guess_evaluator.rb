class GuessEvaluator

  attr_reader :input,
              :secret
              
  def initialize(input , secret)
    @input = input.upcase.split("")
    @secret = secret
  end

  def guess_correct?
    input == secret
  end

  def guess_too_short?
    input.size < secret.size
  end

  def guess_too_long?
    input.size > secret.size
  end

  def guess_num_colors_correct
    input.uniq.count do |color|
      secret.uniq.include?(color)
    end
  end

  def guess_correct_positions
    positions = @input.zip(secret).count {|guess, secret| guess == secret}
  end
end

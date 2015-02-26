class SequenceGenerator

  attr_accessor :color_bank

  attr_reader :secret

  def initialize
    @color_bank = ["r","g","b","y"]
    @secret = Array.new(4)
  end

  def generate_sequence
    secret = color_bank.sample(4)
  end

end
#
# seq = SequenceGenerator.new
#
# print seq.sequence_generator

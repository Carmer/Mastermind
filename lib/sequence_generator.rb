class SequenceGenerator

  attr_reader :sequence_length,
              :colors

  def initialize
  @colors = ["R", "G", "Y", "B"]
  @sequence_length = 4
  end

  def generate_sequence
    (1..sequence_length).map { colors.sample }
  end
end

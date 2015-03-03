class SequenceGenerator

  #COLORS = {easy: ["R", "G", "B", "Y"], medium: ["R", "G", "B", "Y", "P"], hard: ["R", "G", "B", "Y", "P", "I"]}

  attr_reader :sequence_length,
              :colors

  def initialize
  @colors = ["R", "G", "Y", "B"]
  end

  def generate_sequence
    (1..colors.size).map { colors.sample }
  end
end

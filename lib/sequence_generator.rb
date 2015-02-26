class SequenceGenerator

  COLORS = ["r", "g", "y", "b"]
  SEQUENCE_LENGTH = 4

  def generate_sequence
    (1..SEQUENCE_LENGTH).map { COLORS.sample }
  end
end

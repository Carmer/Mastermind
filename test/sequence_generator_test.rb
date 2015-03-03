require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_generator'

class MastermindTest < Minitest::Test

  def test_it_generates_random_sequence
    test = SequenceGenerator.new
    sample = []
    10.times {test.generate_sequence << sample}
    assert sample.uniq
  end

end

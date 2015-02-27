require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class PrinterTest < Minitest::Test


  def test_it_has_the_expected_messages
  expected = [:welcome, :goodbye, :begin, :what_is_your_guess, :guess_too_few_char, :guess_too_many_char, :guess_correctness, :out_of_guesses, :instructions, :guess_prompt, :winner, :try_again, :quit]

  printer = Printer.new
  expected.each do |message|
    assert printer.respond_to?(message), "Printer should have a #{message} method"
    end
  end
end

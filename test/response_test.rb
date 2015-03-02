require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'

class ResponseTest < Minitest::Test


  def test_it_has_the_expected_messages
  expected = [:welcome, :begin_game, :guess_too_short, :guess_too_long, :correct_input, :out_of_guesses, :instructions, :winner, :quit]

  printer = Response.new
  expected.each do |message|
    assert printer.respond_to?(message), "Response should have a #{message} method."
    end
  end
end

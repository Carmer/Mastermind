#require './lib/printer'
class Response
  attr_accessor :status,
                :guess_count

  def initialize
      @guess_count = 0
  end

  def winner(guess, guess_count, total_min, total_sec)
    @status   = :won
    if guess_count < 2
        print "Congratulations! You guessed the sequence '#{guess.upcase}', in #{guess_count} guess over #{total_min} minutes and #{total_sec} seconds.\n(p)lay again? or (q)uit?\n>"
      else
        print "Congratulations! You guessed the sequence '#{guess.upcase}', in #{guess_count} guesses over #{total_min} minutes and #{total_sec} seconds.\n(p)lay again? or (q)uit?\n> "
    end
  end

  def guess_too_short
    @status = :continue
    print "Your guess had too few characters. Why don't you try again, and this time the right way.\n> "
  end

  def guess_too_long
    @status = :continue
    print "Your guess had too many characters. You must not be very good with instructions. Why don't you try again, and this time the right way.\n> "
  end

  def correct_input(input, num_correct, correct_positions)
    @guess_count += 1
    @status  = :continue
    print "Your guess #{input.upcase} had #{num_correct} characters correct, #{correct_positions} in the correct position.\nGuess again...\n> "
  end

  def invalid_input
    @status  = :continue
    print "Those are not even colors in our game. You don't follow directions well, do you?\nGuess again \n> "
  end

  def out_of_guesses
    @status  = :game_over
    print "Sorry, you're out of guesses. It's not that you're bad at this game, you're just not good. Better luck next time dummy."
  end

  def quit
    @status  = :game_over
    print "You're a quitter. What would your momma say?"
  end

  def instructions
    @status  = :continue
    print "Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the computer must reveal how many colors are in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, you must improve upon your previous guess to crack the code. You have 10 chances to guess the correct sequence before you lose the game.\n> "
  end

  def begin_game
    @status  = :continue
    print "\nI have gernerated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end game.\nWhat's your first guess\n > "
  end

  def welcome
    @status  = :continue
    print "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def cheat(secret)
    @status  = :continue
    print "#{secret}\n\nCheating - huh? I never pegged you for a cheater.\nMake a guess...\n>"
  end
end

class Printer

  def welcome
    print "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def goodbye
    print "Goodbye!"
  end

  def begin
    print "\nI have gernerated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end game.\nWhat's your first guess\n > "
  end

  def what_is_your_guess
    print "What is your guess?"
  end

  def guess_too_few_char
    print "Your guess had too few characters. Why don't you try again, and this time the right way."
  end

  def guess_too_many_char
    print "Your guess had too many characters. You must not be very good with instructions. Why don't you try again, and this time the right way."
  end

  def guess_correctness #need to enter feedback interpolation below
    print "Your guess had #{} characters correct, #{} in the correct position."
  end

  def out_of_guesses
    print "Sorry, you're out of guesses. You suck at this game. Better luck next time - You need it."
  end

  def instructions
    print "Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the computer must reveal how many colors are in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, you must improve upon your previous guess to crack the code. You have 10 chances to guess the correct sequence before you lose the game."
  end

  def cheat
    #print secret from sequence generator
  end

  def guess_prompt

    print "Whats your guess?\n> "
  end

  def winner
    print "You win!"
  end

  def try_again
    print "Guess Again!"
  end

  def quit
    print "You're a quitter. What would your momma say?"
  end


end

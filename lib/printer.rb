class Printer

  def welcome
    print "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def goodbye
    print "Goodbye!"
  end

  def begin
    print "\nI have gernerated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end game.\nWhat's your first guess\n > "
  end

  def what_is_your_guess
    print "What is your guess?\n> "
  end

  def guess_too_few_char
    print "Your guess had too few characters. Why don't you try again, and this time the right way.\n> "
  end

  def guess_too_many_char
    print "Your guess had too many characters. You must not be very good with instructions. Why don't you try again, and this time the right way.\n> "
  end

  def guess_correctness(guess, guess_num_correct, guess_correct_positions) #need to enter feedback interpolation below
    print "Your guess #{guess.upcase} had #{guess_num_correct} characters correct, #{guess_correct_positions} in the correct position.\nGuess again...\n> "
  end

  def out_of_guesses
    print "Sorry, you're out of guesses. It's not that you're bad at this game, you're just not good. Better luck next time dummy."
  end

  def instructions
    print "Mastermind is a code-breaking game that helps develop deductive reasoning and logic by requiring players to deduce secret combinations of colors with minimal clues. After each of these chances, the computer must reveal how many colors are in the correct location, or the correct color in the incorrect location, or completely incorrect. With this little information, you must improve upon your previous guess to crack the code. You have 10 chances to guess the correct sequence before you lose the game.\n> "
  end

  def guess_prompt
    print "Whats your guess?\n> "
  end

  def winner(guess, response_count, total_min, total_sec)
    if response_count < 2
        print "Congratulations! You guessed the sequence '#{guess.upcase}', in #{response_count} guess over #{total_min} minutes and #{total_sec} seconds.\n(p)lay again? or (q)uit?\n>"
      else
        print "Congratulations! You guessed the sequence '#{guess.upcase}', in #{response_count} guesses over #{total_min} minutes and #{total_sec} seconds.\n(p)lay again? or (q)uit?\n> "
    end
  end

  def quit
    print "You're a quitter. What would your momma say?"
  end

  def incorrect_input
    print "Those are not even colors in our game. You don't follow directions well, do you?\nGuess again \n> "
  end

  def cheat(secret)
    print "#{secret}\n\nCheating - huh? I never pegged you for a cheater.\nMake a guess...\n>"
  end

end

class Game

  def initialize
    @code = []
    @colors = ["r", "g", "b", "y"]
    @running = true
    @difficulty = ""
    @beginning_time = Time.now
    @num_guesses = 0
  end

  def start(state_machine,ui)
    generate_code
    ui.game_start_prompt(@difficulty)

    while @running
      check_guess(get_guess,ui)
    end

    state_machine.current_state = "menu"
  end

  def generate_code
    @code = []
    4.times do |i|
      rand_num = Random.new.rand(4)
      @code.push(@colors[rand_num])
    end
  end

  def get_guess
    print "Please enter a guess: "
    guess = gets.chomp

    check_for_quit(guess)
    check_for_cheat(guess)

    while guess.length != 4
      if guess.length < 4
        print "Your guess is too short. Please enter a valid guess: "
      elsif guess.length > 4
        print "Your guess is too long. Please enter a valid guess: "
      end
      guess = gets.chomp
    end

    guess = guess.split("")
  end

  def check_guess(guess,ui)
    @num_guesses += 1
    if guess == @code
      end_time = Time.now
      puts "Congratulations! You guessed the sequence \"#{@code.join}\" in #{@num_guesses} guesses over #{(end_time - @beginning_time).to_i} seconds."
      puts "Do you want to (P)lay again or (Q)uit?"
      input = gets.chomp.upcase

      if input == "P"
        generate_code
        @num_guesses = 0
        @beginning_time = Time.now
        ui.game_start_prompt(@difficulty)

      elsif input == "Q"
        @running = false
      end
    else
      puts "You're guess had #{check_pos(guess)} pegs in the correct position and #{check_color(guess)} correct colors."
    end
  end

  def check_color(guess)
    correct_num_colors = 0
    guess_uniq = guess.uniq

    correct_num_colors =
      guess_uniq.count do |value|
        @code.include?(value)
      end
  end

  def check_pos(guess)
    num_correct_pos = 0

    guess.each_index do |i|
      if guess[i] == @code[i]
        num_correct_pos += 1
      end
    end
    return num_correct_pos
  end

  def check_for_cheat(guess)
    if guess == 'c' || guess == "cheat"
      puts "You Cheater! The answer is #{@code.join(",")}"
    end
  end

  def check_for_quit(guess)
    if guess == 'q' || guess == 'quit'
      puts "Thank you for playing!"
      @running = false
    end
  end
end

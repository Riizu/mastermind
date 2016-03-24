require_relative 'guess_history'
require_relative 'highscore'

class Game

  def initialize
    @code = []
    @colors = ["r", "g", "b", "y"]
    @guess_history = GuessHistory.new
    @highscore = Highscore.new
    @running = true

    generate_code
  end

  def start


    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."

    while @running
      guess = get_guess
      check_guess(guess)
    end
    $state = "menu"
  end

  def generate_code
    4.times do |i|
      rand_num = Random.new.rand(4)
      @code.push(@colors[rand_num])
    end
  end

  def get_guess
    guess = ""
    print "Please enter a guess: "
    guess = gets.chomp

    while guess.length != 4 || guess.length == 1
      check_for_quit(guess)
      check_for_cheat(guess)
      print "Please enter a valid guess: "
      guess = gets.chomp
    end

    guess = guess.split("")
  end

  def check_guess(guess)
    if guess == @code
      puts "you guessed correctly!"
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

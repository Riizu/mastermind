require_relative 'game'
require_relative 'highscore'

$state = "menu"

def print_menu
  puts "-------------------------------------------------"
  puts "|                 welcome to                    |"
  puts "|                 MASTERMIND                    |"
  puts "|  (P)lay (H)igh Scores (I)nstructions (E)xit   |"
  puts "-------------------------------------------------"
end

def getInput
  print "Please enter a command: "
  input = gets.chomp.upcase

  case input
  when "P"
    $state = "game_start"
  when "H"
    $state = "highscore"
  when "I"
    $state = "instructions"
  when "E"
    $state = "exit"
  end
end

def print_instructions
  puts "-------------------------------------------------"
  puts "|      Some Instructions on MASTERMIND           |"
  puts "-------------------------------------------------"
  puts "MASTERMIND is a two-player game where one person"
  puts "creates a secret code, and the other attempts to"
  puts "guess that code, using only a couple of pieces"
  puts "of information - the number of correct colors,"
  puts "and the number of correctly guessed positions."
  puts "In this version, players are able to select"
  puts "between one and two player variants, as well as"
  puts "three difficulties:"
  puts "-------------------------------------------------"
  puts "|   Beginner:       4 positions  4 colors       |"
  puts "|   Intermediate:   6 positions  5 colors       |"
  puts "|   Advanced:       8 positions  6 colors       |"
  puts "-------------------------------------------------"
  puts "In order to enter a guess, players enter the"
  puts "required number of positions using the colors"
  puts "listed at the beginning of the game. When they"
  puts "have correctly guessed the code, they will be asked "
  puts "to play again and to enter their name if they have "
  puts "earned a high score."
end

running = true

while running
  case $state
  when "menu"
    print_menu
    getInput
  when "game_start"
    game = Game.new
    game.start
  when "highscore"
    getInput
  when "instructions"
    print_instructions
    getInput
  when "exit"
    running = false
  end
end

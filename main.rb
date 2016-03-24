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
  print "Please enter a command:"
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
    getInput
  when "exit"
    running = false
  end
end

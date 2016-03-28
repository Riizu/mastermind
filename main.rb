require_relative 'game'
require_relative 'highscore'
require_relative 'state_machine'
require_relative 'user_interface'

state_machine = StateMachine.new
ui = UserInterface.new
running = true

while running

  case state_machine.current_state
  when "menu"
    ui.print_menu
    ui.user_prompt(state_machine)
  when "game_start"
    game = Game.new
    game.start(state_machine,ui)
  when "highscore"
    ui.user_prompt(state_machine)
  when "instructions"
    ui.print_instructions
    ui.print_menu
    ui.user_prompt(state_machine)
  when "exit"
    running = false
  end
end

$LOAD_PATH << './lib'

require 'game'

game = Game.new

game.welcome_message

game.set_human_player
game.set_machine_player

game.start

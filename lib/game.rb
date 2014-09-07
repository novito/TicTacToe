require 'human_player'
require 'machine_player'
require 'grid'

class Game
  attr_reader :human_player, :machine_player, :grid, :starter

  def initialize
    @grid = Grid.new
  end

  def welcome_message
    puts '#########################################'
    puts '#### Welcome to the Tic-Tac-Toe game ####'
    puts '#########################################'
  end

  def set_human_player
    print "Write your name:"
    human_player_name = gets.chomp
    @human_player = HumanPlayer.new(human_player_name)
  end

  def set_machine_player
    print "Write the name of your AI opponent:"
    machine_player_name = gets.chomp
    @machine_player = MachinePlayer.new(machine_player_name)
  end

  def start
    print "Do you want to start? (y/n):"
    human_starts = gets.chomp
    human_starts[0].downcase == 'y' ? play(human_player, machine_player) : play(machine_player, human_player)
  end

  def play(current_player, adversary)
    grid.draw

    cell_number = current_player.play(grid, adversary)
    grid.mark_cell(cell_number, current_player.initial)

    if grid.winner
      finish(current_player)
    elsif grid.has_tie?
      finish
    else
      play(adversary, current_player)
    end
  end

  def finish(winner = nil)
    grid.draw
    winner.nil? ? puts("Nobody wins. It's a tie!") : puts("We have a winner! Congrats #{winner.name}")
  end
end

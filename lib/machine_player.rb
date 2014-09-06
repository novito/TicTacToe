require 'player'

class MachinePlayer < Player
  attr_reader :best_first_moves

  def initialize(name)
    @best_first_moves = [0,2,4,6]
    super(name)
  end
end

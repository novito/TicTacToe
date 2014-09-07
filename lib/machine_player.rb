require 'player'

class MachinePlayer < Player
  attr_reader :best_first_moves

  def initialize(name)
    @best_first_moves = [0,2,4,6]
    super(name)
  end

  def play(grid, opponent)
    return best_first_moves.sample if grid.empty?
    best_play(grid, 0, self, opponent)
  end

  def best_play(grid, depth, current_player, opponent, scores={})
    return -1 if grid.winner
    return 0 if grid.has_tie?

    grid.free_cells.each do |cell_number|
      grid.mark_cell(cell_number, current_player.initial)
      scores[cell_number] = -1 * best_play(grid, depth - 1, opponent, current_player, {})
      grid.remove_cell(cell_number)
    end

    if depth == 0
      return scores.max_by { |cell_number, score| score }[0]
    else
      return scores.max_by { |cell_number, score| score }[1]
    end
  end
end

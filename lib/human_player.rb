require 'player'

class HumanPlayer < Player
  PLAY_MESSAGE = 'Please select a cell:'
  NOT_A_NUMBER_ERROR_MESSAGE = 'Invalid cell selection. It must be a number between 0 and 8.'
  NOT_FREE_CELL_ERROR_MESSAGE = 'Selected cell is not free.'

  def play(grid, adversary)
    puts PLAY_MESSAGE

    begin
      cell_number = Integer(gets.chomp)
    rescue ArgumentError
      puts NOT_A_NUMBER_ERROR_MESSAGE
      play(grid, adversary)
    end

    if board.free_cells.include?(cell_number)
      return cell_number
    else
      puts NOT_FREE_CELL_ERROR_MESSAGE
      play(grid, adversary)
    end
  end
end

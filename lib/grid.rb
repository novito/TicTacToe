class Grid
  COLUMN_SEPARATOR = " | "
  ROW_SEPARATOR = " \n-----------\n "

  attr_reader :dimension, :status, :winner_combinations

  def initialize
    @dimension = 3
    @winner_combinations = [
      [0,1,2],[3,4,5],
      [6,7,8],[0,3,6],
      [1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]
    @status = Array.new(dimension*dimension)
  end

  def size
    dimension * dimension
  end

  def draw
    filled_status = fill_empty_cells
    matrix_status = status_to_matrix(filled_status)
    column_separated = separate_columns(matrix_status)
    row_and_column_separated = separate_rows(column_separated)

    puts
    puts " #{row_and_column_separated}"
    puts
  end

  def mark_cell(cell_number, mark)
    status[cell_number] = mark
  end

  def free_cells
    status.each_index.select { |i| status[i].nil? }
  end

  def winner
    winner_combinations.each do |row|
      values = row.map { |cell| status[cell] }
      unique_values = values.uniq
      return unique_values.first if unique_values && unique_values.size == 1
    end
    nil
  end
    
  def has_tie?
    free_cells.size == 0
  end

  def remove_cell(cell_number)
    status[cell_number] = nil
  end

  def empty?
    free_cells.size == size
  end

  private

  def fill_empty_cells
    status.map { |cell| cell.nil? ? ' ' : cell }
  end

  def status_to_matrix(status)
    status.each_slice(dimension).to_a
  end

  def separate_columns(matrix_status)
    matrix_status.map { |row| row.join(COLUMN_SEPARATOR) }
  end

  def separate_rows(status)
    status.join(ROW_SEPARATOR)
  end

end

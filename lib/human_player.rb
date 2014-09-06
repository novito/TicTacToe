class HumanPlayer
  attr_reader :name

  def initialize(name)
    raise ArgumentError, "Name can't be blank" if name.nil? || name.strip.empty?
    @name = name
  end
end

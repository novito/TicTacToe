class HumanPlayer
  def initialize(name)
    raise ArgumentError, "Name can't be blank" if name.nil? || name.strip.empty?
  end
end

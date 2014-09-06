class MachinePlayer
  attr_reader :name

  def initialize(name)
    raise ArgumentError, "Name can't be blank" if name.nil? || name.strip.empty?
    @name = name
  end

  def initial
    name[0].upcase
  end
end

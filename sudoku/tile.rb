require 'colorize'

class Tile
  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def to_s
    @given ? @value.to_s.colorize(:light_magenta) : @value.to_s
  end
end

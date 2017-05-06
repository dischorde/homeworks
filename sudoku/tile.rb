require 'colorize'

class Tile
  attr_reader :given, :value

  def initialize(value)
    raise "Invalid value" unless value.between?(0, 9)
    @value = value
    @given = value.zero? ? false : true
  end

  def colorized
    @given ? @value.to_s.to_s.colorize(:white) : @value.to_s.colorize(:light_magenta)
  end

  def to_s
    @value.zero? ? " " : colorized
  end

  def empty?
    @value.zero?
  end

  def value=(val)
    raise "Cannot change a given value!" if @given
    raise "Invalid value" unless val.between?(1, 9)
    @value = val
  end
end

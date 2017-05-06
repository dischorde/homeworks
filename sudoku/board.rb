require 'byebug'

class Board
  def empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def self.from_file(filename)
    grid = File.readlines(filename).map do |line|
      num_arr = line.chomp.chars
      num_arr.map { |num| Tile.new(Integer(num)) }
    end
    self.new(grid)
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end
end

Board.from_file("puzzles/sudoku1.txt")

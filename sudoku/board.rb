require 'set'
require_relative 'tile'

class Board
  def self.empty_grid
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

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def solved?
    rows_solved? && columns_solved? && squares_solved?
  end

  def valid_pos?(pos)
    row, col = pos
    row.between?(0, 8) && col.between?(0, 8)
  end

  def valid_value?(val)
    val.between?(1, 9)
  end

  def render
    puts " |  " + (0..8).to_a.join("  |  ") + "   "
    puts horizontal_divider
    @grid.each_with_index do |row, idx|
      puts "#{idx}|  " + row.join("  |  ") + "  "
      puts horizontal_divider
    end
  end

  private

  def horizontal_divider
    "-------------------------------------------------------"
  end

  def squares_solved?
    (0..8).step(3) do |row_pos|
      (0..8).step(3) do |col_pos|
        square = square_set(row_pos, col_pos)
        return false unless section_solved?(square)
      end
    end
    true
  end

  def square_set(row, col)
    square_pos = [[row, col], [row, col + 1], [row, col + 2],
                  [row + 1, col], [row + 1, col + 1], [row + 1, col + 2],
                  [row + 2, col], [row + 2, col + 1], [row + 2, col + 2]]

    square = Set.new
    square_pos.each do |pos|
      tile = self[pos]
      square << tile.value unless tile.empty?
    end
    square
  end

  def rows_solved?
    @grid.each do |tile_row|
      row = Set.new
      tile_row.each do |tile|
        row << tile.value unless tile.empty?
      end
      return false unless section_solved?(row)
    end
    true
  end

  def columns_solved?
    (0..8).each do |col_pos|
      col = Set.new
      (0..8).each do |row_pos|
        tile = self[[row_pos, col_pos]]
        col << tile.value unless tile.empty?
      end
      return false unless section_solved?(col)
    end
    true
  end

  def section_solved?(section)
    section.length == 9
  end
end

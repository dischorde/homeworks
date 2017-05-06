require_relative 'board'

class Game
  def self.from_file(filename)
    board = Board.from_file(filename)
    self.new(board)
  end

  def initialize(board)
    @board = board
  end

  def play
    welcome
    until won?
      @board.render
      get_user_input
    end
    @board.render
    puts "You won!"
  end

  private

  def welcome
    puts "Welcome to Sudoku!"
    puts "I'm assuming you know how to play..."
  end

  def won?
    @board.solved?
  end

  def get_user_input
    pos = get_position
    value = get_value
    @board[pos].value = value
  end

  def get_position
    puts "Where would you like to input a number? (format: row, col)"

    pos = nil
    until pos
      pos = parse_pos(gets.chomp)
      unless pos && @board.valid_pos?(pos)
        puts "Invalid Position"
        pos = nil
      end
    end

    pos
  end

  def get_value
    puts "What value would you like to place?"
    val = nil
    until val && @board.valid_value?(val)
      puts "Invalid value" if val
      begin
        val = Integer(gets.chomp)
      rescue
        puts "You can only add numbers between 1 and 9"
        retry
      end
    end

    val
  end

  def parse_pos(pos)
    pos.split(", ").map(&:to_i)
  end
end

if $PROGRAM_NAME == __FILE__
  g = Game.from_file("puzzles/sudoku1.txt")
  g.play
end

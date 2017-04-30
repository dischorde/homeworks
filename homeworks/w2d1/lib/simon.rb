require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @sequence_length = 1
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    puts "Sequence is: #{@seq.join('  ')}"
    sleep(2)
    system("clear")
  end

  def require_sequence
    guess = nil
    prompt_for_input
    until is_valid?(guess)
      puts "Invalid response. Try again with proper formatting." if guess
      guess = gets.chomp.split
    end
    @game_over = is_wrong?(guess)
  end

  def prompt_for_input
    puts "What was the sequence? Guess colors with spaces between each color."
    puts "For example: red blue blue green red yellow"
  end

  def is_wrong?(guess)
    guess != @seq
  end

  def is_valid?(sequence)
    return false unless sequence
    sequence.is_a?(Array) && sequence.all? { |color| COLORS.include?(color) }
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct! Your score is #{sequence_length} colors."
  end

  def game_over_message
    puts "Game over :( Sequence was #{@seq.join('  ')}."
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end

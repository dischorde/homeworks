require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    (0..12).each do |idx|
      next if idx == 6
      @cups[idx] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
    true
  end

  def make_move(start_pos, current_player_name)
    opponent_store = (current_player_name == @name1 ? 13 : 6)
    #byebug if start_pos == 12

    stones = @cups[start_pos]
    @cups[start_pos] = []
    next_cup = start_pos


    until stones.empty?
      next_cup = (next_cup + 1) % 14
      next if next_cup == opponent_store
      @cups[next_cup] << stones.shift
    end

    render
    next_turn(next_cup)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].flatten.empty? || @cups[7..12].flatten.empty?
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end

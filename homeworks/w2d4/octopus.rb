class Array
  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    middle = (self.length - 1) / 2
    left = self[0..middle].merge_sort(&prc)
    right = self[(middle + 1)..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    left = left.dup
    right = right.dup

    merged = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) < 0
        merged += [left.shift]
      else
        merged += [right.shift]
      end
    end
    merged + left + right
  end

  def selection_sort(&prc)
    self.dup.selection_sort!(&prc)
  end

  def selection_sort!(&prc)
    prc ||= Proc.new { |val1, val2| val1 <=> val2 }

    (self.length - 1).times do |j|
      ((j + 1)...self.length).each do |k|
        self[j], self[k] = self[k], self[j] if prc.call(self[j], self[k]) == 1
      end
    end
    self
  end
end

def sluggish_octopus(fishes)
  fishes.selection_sort.last
end

def dominant_octopus(fish)
  fish.merge_sort.last
end

def clever_octopus(fishes)
  longest_fish = ''
  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

def slow_dancing_octopus(direction, tiles_array)
  tiles_array.each_with_index do |tile_dir, idx|
    return idx if tile_dir == direction
  end
  nil
end

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end

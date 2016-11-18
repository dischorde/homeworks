class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map

  def initialize
    @map = Array.new { [] }
  end

  def assign(key, value)
    pair_idx = lookup_index(key)
    if pair_idx.nil?
      @map << [key, [value]]
    else
      new_values = @map[pair_idx].last << value
      @map[pair_idx] = [key, new_values]
    end
  end

  def lookup(key)
    pair_idx = lookup_index(key)
    return nil if pair_idx.nil?
    @map[pair_idx].last
  end

  def remove(key)
    pair_idx = lookup_index(key)
    return nil if pair_idx.nil?
    @map.delete_at(pair_idx)
  end

  def show
    @map.dup
  end

  private

  def lookup_index(key)
    @map.find_index { |pair| pair.first == key }
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el): el }
  end

end

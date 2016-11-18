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
    previous_vals = lookup(key)
    if previous_vals.nil?
      @map << [key, [value]]
    else
      new_values = previous_vals << value
      pair_idx = @map.find_index([key, previous_vals])
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

  def lookup_index(key)
    @map.find_index { |pair| pair.first == key }
  end

  def show
    @map.dup
  end

end

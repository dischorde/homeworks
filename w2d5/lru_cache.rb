class LRUCache
  def initialize(size)
    @cache = Array.new(size) { nil }
  end

  def count
    # returns number of elements currently in cache
    @cache.count { |el| el }
  end

  def add(el)
    # adds element to cache according to LRU principle
    idx_in_cache = @cache.index(el)
    if idx_in_cache.nil?
      @cache.shift
    else
      @cache.delete_at(idx_in_cache)
    end
    @cache.push(el)
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache.dup
  end

  private
  # helper methods go here!

end

if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show
end

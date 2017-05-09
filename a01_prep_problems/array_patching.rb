require 'byebug'
class Array

  def my_each(&prc)
    self.length.times do |idx|
      prc.call(self[idx])
    end
    self
  end

  def my_each_with_index(&prc)
    self.length.times do |idx|
      prc.call(self[idx], idx)
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |el|
      rejected << el unless prc.call(el)
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flattened = []
    self.my_each do |el|
      if el.is_a? Array
        flattened += el.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    flattened = []
    self.my_each do |el|
      if n > 0 && el.is_a?(Array)
        flattened += el.my_controlled_flatten(n - 1)
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*arrs)
    idx = 0
    zipped = []

    loop do
      at_idx = (idx < self.length ? [self[idx]] : [])
      arrs.each do |arr|
        next unless idx < arr.length
        at_idx << arr[idx]
      end
      break if at_idx.empty?
      zipped << at_idx
      idx += 1
    end

    zipped
  end

  def my_rotate(num = 1)
  end

  def my_join(str = "")
  end

  def my_reverse
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
  end

  def permutations
  end

  def bubble_sort(&prc)
  end

  def bubble_sort!(&prc)
  end
end

#p [1,2,3,4].permutations == [1,2,3,4].permutation.to_a
#
# p [3,4,1,5,2,7,9].sort == [3,4,1,5,2,7,9].bubble_sort
# p [12,13,5,4,3,2,1].sort == [12,13,5,4,3,2,1].bubble_sort
# p [1,2,3,4,5].sort! == [1,2,3,4,5].bubble_sort!

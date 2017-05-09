require 'byebug'
class Array

  def my_each(&prc)
  end

  def my_each_with_index(&prc)
  end

  def my_select(&prc)
  end

  def my_reject(&prc)
  end

  def my_any?(&prc)
  end

  def my_all?(&prc)
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
  end

  def my_zip(*arrs)
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

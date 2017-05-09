require 'byebug'

class Hash

  # Write a version of my each that calls a proc on each key, value pair
  # def my_each(&prc)
  #   all_keys = self.keys
  #   all_keys.length.times do |idx|
  #     key = all_keys[idx]
  #     prc.call(key, self[key])
  #   end
  #   self
  # end

  def my_each(&prc)
  end

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
  end

end

#
# a = {a: 1, b: 2, c: 3}
# b = {d: 4, e: 5}
# c = {c: 33, d: 4, e: 5}
#
# p a.merge(b)
# p a.my_merge(b) == a.merge(b)
#
# p a.merge(c)
# p a.my_merge(c) == a.merge(c)

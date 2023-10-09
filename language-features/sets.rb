require 'set'


#"to_set" converts array or other enumerable to a set

nums = [1,2,3,4,5,1]
puts nums
nums_as_set = nums.to_set
puts nums_as_set


puts "\n"

# create a set from it's contents

my_set = Set["a","b","c","a"]
puts my_set

puts "\n"


new_set = Set.new(nums)
puts new_set


puts "\n"

# set back to an array
set_to_array = nums_as_set.to_a;
puts set_to_array;
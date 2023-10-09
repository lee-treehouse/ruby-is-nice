def test(expected, actual)
    if expected != actual
        puts "FAIL:"
        puts "Expected: #{expected}"
        puts "Actual: #{actual}"
    else 
        puts "PASS"
    end
end

=begin
Given an integer array nums, return true if any value appears at least twice in the array, 
and return false if every element is distinct.
=end

require 'set'

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    nums_as_set = nums.to_set
    return nums.length > nums_as_set.length
end

test(true,contains_duplicate([1,3,5,6,1]))
test(false,contains_duplicate([1,2,3,4]))

# this had a longer runtime and used more memory than my initial solution
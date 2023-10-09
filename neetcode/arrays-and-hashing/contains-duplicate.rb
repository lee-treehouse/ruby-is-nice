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

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    
    seen = {}
    nums.each do |num|
        if seen[num] == true
            return true;
        else
            seen[num] = true
        end
    end
    
    return false
end

test(true,contains_duplicate([1,3,5,6,1]))
test(false,contains_duplicate([1,2,3,4]))

# this works but is not ruby style and I'm not using sets

# here are some options
#https://leetcode.com/problems/contains-duplicate/solutions/2226024/3-solutions-in-ruby/
# i tried a set option which wasn't more performative
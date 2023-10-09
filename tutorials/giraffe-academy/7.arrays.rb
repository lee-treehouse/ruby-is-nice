lucky_numbers = [4,8, "fifteen", 16, 23, 42.0]

puts lucky_numbers

lucky_numbers[0] = 90

puts lucky_numbers[0]
puts lucky_numbers[1]

puts "\n"

puts "hmm negative numbers"

# -1 is the end of the array, -2 would be second from the end
puts lucky_numbers[-1]
puts lucky_numbers.length
puts lucky_numbers.length()
puts lucky_numbers[lucky_numbers.length() -1]

puts "\n\n"

# starting at position 2, with a length of 3
puts lucky_numbers[2,3]

puts "\n\n"

# starting at position 2, to (inclusive) position 4
puts lucky_numbers[2..4]

puts "\n\n"

puts lucky_numbers.length

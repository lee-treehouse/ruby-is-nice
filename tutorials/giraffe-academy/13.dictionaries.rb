#https://www.tutorialspoint.com/ruby/ruby_hashes.htm

test_grades = {
    "Holly" => "B",
    :"Kate" => "C",
    :"Lee" => "D",
    3 => "B"
}

test_grades["Lee"] = "B"

# number is a key, not an index position

puts(test_grades)
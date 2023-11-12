string = "abc123"
string[0,3]
# "abc"
string[3,3]
# "123"

# The first number is the starting index.

# The second number is how many characters you want.

# You can also use a range if you want to do something like “get all the characters but the last one”.

puts(string[0..-2])
# "abc12"


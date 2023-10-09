# https://rubyapi.org/3.2/o/string
# https://ruby-doc.org/core-3.1.0/String.html

greeting = "hello"

#indexes 01234

puts greeting.length
puts greeting[0]
puts greeting.include? "llo"
puts greeting.include? "z"


# substring 
puts greeting [1,3] 
# second param is length not index
puts greeting [2,3]

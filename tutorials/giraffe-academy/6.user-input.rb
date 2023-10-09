puts "Enter your name: " 
name = gets # this will have a new line character.. using "chomp will eliminate it"
puts "Hello #{name}, How are you?"

puts "Enter first num: "
num1 = gets.chomp 
puts "enter second num: "
num2 = gets.chomp 
puts num1.to_f + num2.to_f
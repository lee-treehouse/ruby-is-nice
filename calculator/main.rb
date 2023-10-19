require_relative './lib/calculator.rb'

calculator = Calculator.new(10)
calculator.doThing("add", 5)
puts(calculator.current_value)

calculator.doThing("subtract", 2)
puts(calculator.current_value)

puts("------")

showAllAvailableMethods = false
if showAllAvailableMethods then
    puts(self.private_methods.sort())    
end


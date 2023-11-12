# discussed in this video 
# https://www.youtube.com/watch?v=EBFWAGkIFZM&t=2s
# Rails on Ruby: How Ruby Makes Rails Great by Noel Rappin
# example in video is used in StringInquirer 
# allows you to ask Rails.env.production? instead of RAils.env == "production"
# https://github.com/rails/rails/blob/5534a2286b17e361ebfdca078e411578ed493e83/activesupport/lib/active_support/string_inquirer.rb#L21
# in my words, if the method is missing but it ends in a ? you probably didn't want to call the method
# but intead wanted to say hey does this thing equal that? 
# which we do by returning 
# in this case "production" so you can do an equality comparison just fine
# if it didn't end in a ? you probably did want to call the method which is why we call super so an 
# upstream method_missing handler will get it


# more examples from RoR codebase
# https://github.com/search?q=repo%3Arails%2Frails%20method_missing&type=code


# if you're going to implement a method_missing method, you should implement a responds_to_missing method
# that has the same critieria so we can dynamically say if we will respond to missing method or not

class Calculator
    attr_reader :current_value, :owner

    def initialize(initial_value, owner)
       @current_value = initial_value
       @owner = owner
    end

    def method_missing(method_name, *arguments)
        puts("")    
        puts("**")
        puts("Calculator missing method handler")
        puts("I don't have that method, sorry")
        puts("method_name: ")
        puts(method_name)
        puts("arguments: ")
        puts(arguments)
        puts("**")
        puts("")
        # this doesn't call super because it handles the situation completely.
    end

    def responds_to_missing(method_name, include_private = false)
        return true
    end


end

class BetterCalculator < Calculator

    def calculate(operator_name, second_value)
        puts ("Sure, I will perform this operation: #{operator_name} #{second_value} on initial value of #{@current_value}")
    end

end

class CustomisedBetterCalculator < BetterCalculator

    def method_missing(method_name, *arguments)
        if method_name.end_with?("?") then 
            # this gets returned even though it doesn't say "return"
            self.owner == method_name[0..-2]
        else
            super
        end
    end

    def responds_to_missing(method_name, include_private = false)
        return method_name.end_with?("?") || super
    end


end


betterCalculator = BetterCalculator.new(5, "lee");
betterCalculator.calculate("add", 4);

calculator = Calculator.new(6, "lee");
calculator.calculate("add", 7);

betterCalculator.dance("like nobody is watching")

customisedBetterCalculator = CustomisedBetterCalculator.new(1, "lee");
customisedBetterCalculator.dance("like everybody is watching")

puts calculator.lee?
puts customisedBetterCalculator.lee? #true
puts customisedBetterCalculator.ernie? #false


puts calculator.responds_to_missing("ernie")
puts calculator.responds_to_missing("ernie?")
puts customisedBetterCalculator.responds_to_missing("ernie")
puts customisedBetterCalculator.responds_to_missing("ernie?")

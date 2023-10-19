require_relative './operator.rb'
require_relative './add.rb'
require_relative './subtract.rb'

class Calculator
    attr_reader :current_value

    def initialize(initial_value)
       @current_value = initial_value
    end
        
    def getOperator(operator_name)
        case operator_name
        when "add"
            return Add.new;
        when "subtract"
            return Subtract.new;
        else
            puts "unrecognized operator"
        end
    end

    def calculate(operator_name, second_value)
        operator = getOperator(operator_name)
        @current_value = operator.execute(@current_value, second_value)
    end
end
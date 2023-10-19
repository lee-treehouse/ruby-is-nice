class Subtract  < Operator
    # include Slideable
    def execute(old_value, new_value)
      super(old_value, new_value)  
      return old_value - new_value
      end  
end
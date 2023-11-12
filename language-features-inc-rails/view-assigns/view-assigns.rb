# instance variables assigned to in controller methods are automatically accessible in the view
# In my instagram clone I had been wondering how my posts view got @posts
# https://github.com/search?q=repo%3Arails%2Frails%20view_assigns&type=code

# basically from the controller we package up the variable names without the @ into a hash 
# then we load them up in the view 
# easy to explain: at variables in the controller become at variables in the view

class Cat 
    def initialize
    @name = "ernie"
    @build = "chonker"
    end

    def my_public_method
    puts ("I will tell you my secrets")
    
        #_protected_ivars is a rails specific thing
        #_protected_ivars
    end

    protected

    @protected_variable = "if you inherit from me you can access this!"
    def my_protected_method
    end

    private

    @super_private_variable = "top secret, for cat's eyes only"
    def my_private_method
    end

end

cat = Cat.new
puts(cat.instance_variables)
cat.my_public_method
puts(cat)


def view_assigns
    variables = instance_variables - _protected_ivars

    # hash is an accumulator
    # 'name' is the object - in this case its a string because 
    # instance_variables Returns an array of the symbol names of the instance variables in self.

    variables.each_with_object({}) do |name, hash|
      
        #name will have the @ at the front so get rid of it
        #instance_variable_get Returns the value of the given instance variable in self, or nil if the instance variable is not set.
        hash[name.slice(1, name.length)] = instance_variable_get(name)

        # eg [@name, @address, @number] becomes 
        # {
        #     name: "lee",
        #     address: "127 street road",
        #     number: "0409872093745"
        # }
    end
  end
# each with object takes 
# it takes an argument and a block 

class Thing 
    # variables = instance_variables - _protected_ivars

    # variables.each_with_object({}) do |name, hash|
    #   hash[name.slice(1, name.length)] = instance_variable_get(name)
    # end

    def check_it_out
    [:foo, :bar, :jazz].each_with_object({}) do |item, hash|
        hash[item] = item.to_s.upcase
      end
    #   => {:foo=>"FOO", :bar=>"BAR", :jazz=>"JAZZ"}
    end

    def or_check_this_out
    (1..10).each_with_object([]) do |item, array|
        array << item ** 2
      end
    #   => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
    end

end

thing = Thing.new
puts(thing.check_it_out)
puts(thing.or_check_this_out)

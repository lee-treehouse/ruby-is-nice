module MyModule
   GOODMOOD = "happy"
   BADMOOD = "grumpy"
   
  def greet
    return "I'm #{GOODMOOD}. How are you?"
  end
  
  def MyModule.greet
    return "I'm #{BADMOOD}. How are you?"
  end
end  

include MyModule
puts( greet )
puts( MyModule.greet )


# Note: By including MyModule in main (as here) I've ended up mixing it into
# Object. That means the module becomes included in all Ruby classes. This test
# shows this....
class X
end

x = X.new
puts( x.greet )
module MyModule
   GOODMOOD = "happy"
   BADMOOD = "grumpy"
   
  def greet
    return "I'm #{GOODMOOD}. How are you?"
  end
  
  def MyModule.greet
    return "I'm #{BADMOOD}. How are you?"
  end
end  # end of module

puts( "  MyModule::GOODMOOD" )  
puts( MyModule::GOODMOOD )  
puts( "  MyModule.greet" )
puts( MyModule.greet )
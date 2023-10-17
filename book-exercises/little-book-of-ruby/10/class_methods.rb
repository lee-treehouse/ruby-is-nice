class MyClass

  def MyClass.classMethod
    puts( "This is a class method" )
  end

  def self.anotherClassMethod
    puts( "This is a another class method" )
  end

  def instanceMethod
    puts( "This is an instance method" )
  end

end

ob = MyClass.new
MyClass.classMethod
MyClass.anotherClassMethod
ob.instanceMethod

# The following are errors...
#MyClass.instanceMethod
#ob.classMethod
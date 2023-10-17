class MyClass 

    # instance method
    def myMethod 
        puts "yo yo"
    end

    # class method which I would call a static method
    def MyClass.myClassMethod
        puts "wassup"
    end
end 


ob = MyClass.new

ob.myMethod

MyClass.myClassMethod

# in ruby there is a class 'Class' 
# so when I make a class it is an instance of that base class Class
# so new for example is a static method / class method to instantiate an instance
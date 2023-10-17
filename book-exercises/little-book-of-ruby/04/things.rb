class Thing
  @@num_things = 0 # class variable

  def initialize( aName, aDescription )
    @name = aName       # instance variable
    @description = aDescription
    @@num_things +=1    # increment @@num_things
  end
  
  def count
     return @@num_things
  end
end

t1 = Thing.new( "Fred", "A cheerful chap" )
t2 = Thing.new( "Mary", "A jolly woman" )
t3 = Thing.new( "Bert", "A grumpy fellow" )
p( t1 )
p( t2 )
p( t3 )
p( t1.count )
p( t2.count )
p( t3.count )
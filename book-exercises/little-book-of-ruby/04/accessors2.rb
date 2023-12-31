# reading and writing attributes

class Thing

  attr_reader :description
  attr_writer :description
  attr_writer :name

  def initialize( aName, aDescription )
    @name = aName
    @description = aDescription
  end

  # 'long-form' get accessor for @name
  def name
    return @name.capitalize
  end

# I don't need this name 'set' method since I have an attr_writer for name
#  def name=( aName )
#  @name = aName
#  end

end


class Treasure < Thing  # Treasure descends from Thing
  attr_accessor :value

  def initialize( aName, aDescription )
    super( aName, aDescription )
  end

end


 # This is where our program starts...
t1 = Treasure.new( "sword", "an Elvish weapon forged of gold" )
t1.value = 100
t2 = Treasure.new( "dragon horde", "a huge pile of jewels" )
t2.value = 500

puts( "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}" )
puts( "t2 name=#{t2.name}, description=#{t2.description}, value=#{t2.value}" )
puts( "This is treasure1: #{t1.inspect}" )
puts( "This is treasure2: #{t2.inspect}" )

# Bitwise Books http://www.bitwisebooks.com

# This is where I define all the fundamental classes
# from which game objects are created

class Thing
  attr_accessor(:name, :description)

  def initialize(aName, aDescription)
    @name = aName
    @description = aDescription
  end
end

class ThingHolder < Thing
  attr_accessor(:things)

  def initialize(aName, aDescription, someThings)
    super(aName, aDescription)
    @things = someThings
  end

  #:arg: aThing => Thing
  def addThing(aThing)
    @things << aThing
  end

  #:arg: someThings => Array
  def addThings(someThings)
    @things.concat(someThings)
  end

  # find is a method of the Enumerable module which is
  # mixed into the Array class
  def obInThings(aName)
    @things.find {
      |t|
      t.name == aName
    }
  end

  #:arg: aThing => Thing
  #:arg: someThings => Array
  def takeThingFrom(aThing, someThings)
    addThing(someThings.delete(aThing))
  end
end

class Treasure < ThingHolder
  attr_accessor(:value)

  def initialize(aName, aDescription, someThings, aValue)
    super(aName, aDescription, someThings)
    @value = aValue
  end
end

class Room < ThingHolder
  attr_accessor(:n, :s, :w, :e)

  def initialize(aName, aDescription, someThings, dirN, dirS, dirW, dirE)
    super(aName, aDescription, someThings)
    @n = dirN
    @s = dirS
    @w = dirW
    @e = dirE
  end
end

class Actor < ThingHolder
  attr_accessor(:position)

  def initialize(aName, aDescription, someThings, aPosition)
    super(aName, aDescription, someThings)
    @position = aPosition
  end
end

class Map < ThingHolder
  alias :rooms :things
  undef_method(:things)
end

class Game
  attr_accessor(:map)
  # === The Map ===
  # @r0 -- @r1
  #   |
  # @r2 -- @r3
  def initialize(someRooms)
    @map = Map.new("The Map", "The game locations", someRooms)
  end
end

class Implementer
  attr_accessor(:game)
  attr_accessor(:player)

  def initialize(someRooms)
    @game = Game.new(someRooms)
    @player = Actor.new("The Player", "You", [], 0)
  end

  def moveActorTo(anActor, aDirection)
    reply = "No Exit!"
    exit = @game.map.rooms[anActor.position].send(aDirection)
    if (exit > -1)
      anActor.position = exit
      reply = "You have entered the #{@game.map.rooms[exit].name} which is #{@game.map.rooms[exit].description}."
    end
    return reply
  end

  def moveTo(aDirection)
    return moveActorTo(@player, aDirection)
  end
end

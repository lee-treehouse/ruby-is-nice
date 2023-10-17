# Bitwise Books http://www.bitwisebooks.com
require "./adventureclasses"

class Adventure
  def createAdventure
    r1obs = [Treasure.new("sword", "a lovely golden sword", [], 50),
             Treasure.new("ring", "a ring of great power", [], 100),
             Treasure.new("wombat", "small, furry, gently snoring creature", [], 3)]

    someRooms = [Room.new("Treasure Room", "a fabulous golden chamber", r1obs, -1, 2, -1, 1),
                 Room.new("Dragon's Lair", "a huge and glittering lair", [], -1, -1, 0, -1),
                 Room.new("Troll Cave", "a dank and gloomy cave", [], 0, -1, -1, 3),
                 Room.new("Crystal Dome", "a vast dome of glass", [], -1, -1, 2, -1)]

    return Implementer.new(someRooms) #<= return implementor when adventure is created
  end
end

###------------------------------
# To experiment with code to take
# and drop objects, run THIS file
#     ruby advinit.rb
# and uncomment all the code
# below
###------------------------------

#adv = Adventure.new
#imp = adv.createAdventure
#
#x = imp.game.map.rooms[0].obInThings("ring")
#
#print( "Found in room 0: " )
#p x
#print( "Objects in room 0: " )
#p imp.game.map.rooms[0].things
#print( "Objects owned by player: " )
#p imp.player.things
#puts( "Take the ring" )
#imp.player.takeThingFrom( x, imp.game.map.rooms[0].things )
#print( "Objects in room 0: " )
#p imp.game.map.rooms[0].things
#print( "Objects owned by player: " )
#p imp.player.things
#print( "All rooms in the game: " )
#p imp.game.map.rooms

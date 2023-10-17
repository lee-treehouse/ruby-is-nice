def showDay( i )
  case( i )
    when 1 then puts( "It's Monday" )
    when 2 then puts( "It's Tuesday" )
    when 3 then puts( "It's Wednesday" )
    when 4 then puts( "It's Thursday" )
    when 5 then puts( "It's Friday" )
      puts( "...nearly the weekend!")
    when 6, 7  
      puts( "It's Saturday!" ) if i == 6 
      puts( "It's Sunday!" ) if i == 7 
      puts( "Yippee! It's the weekend! " )  
      # the following never executes
    when 5 then puts( "It's Friday all over again!" )
    else puts( "That's not a real day!" )
  end
end

def showTreasures( t )
  case( t )
    when "ring" then puts( "It's a magical ring" )
    when "axe", "sword" then puts( "The #{t} a dwarvish weapon" )
    when 1, 2, "XII" then puts( "#{t} is a number of power" )
    else puts( "I have no idea what a #{t} is" )
  end
end

for i in 1..8 do
  showDay( i )
end

puts 

showTreasures( "ring" )
showTreasures( "axe" )
showTreasures( "sword" )
showTreasures( 1 )
showTreasures( 2 )
showTreasures( "XII" )
showTreasures( "wombat" )
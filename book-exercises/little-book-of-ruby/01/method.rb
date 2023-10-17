# Here I define some free-standing methods. I use a mix of acceptable Ruby syntax
# (both with and without parentheses), and define methods with 0, 1 and 2
# arguments.

def showstring
  puts( "Hello" )
end

def showname( aName )
  puts( "Hello #{aName}" )
end

def return_name( aFirstName, aSecondName )
  return "Hello #{aFirstName} #{aSecondName}"
end

def return_name2 aFirstName, aSecondName 
  return "Hello #{aFirstName} #{aSecondName}"
end

showstring
showname( "Fred" )
puts( return_name( "Mary Mary", "Quite-Contrary"  ) )
puts( return_name2( "Little Jack", "Horner" ) )
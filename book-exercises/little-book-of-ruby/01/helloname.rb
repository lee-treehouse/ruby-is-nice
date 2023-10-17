# Here the parentheses are optional...
# This works

print( 'Enter your name: ' )
name = gets()
puts( "Hello #{name}" )

# ...and so does this:

print 'Enter your name again: ' 
name = gets
puts "Hello #{name}" 

# ...but single quoted strings don't evaluate the variable!:

print 'Enter your name again: ' 
name = gets
puts 'Hello #{name}' 
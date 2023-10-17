i = 10
# one line until
puts( "until 1")
until(i == 10) do puts(i) end # never executes


# multiple-line until where the do keyword is optional
puts( "\nuntil 2")
until(i == 10) # do # never executes
  puts(i)
  i += 1
end


# one line until modifier
puts( "\nuntil 3")
puts(i) until( i == 10) # never executes


# multi-line until modifier, executes 1 or more times
puts( "\nuntil 4")
begin         # executes once
  puts(i)
end until(i == 10)



i = 10
puts( "\nwhile not 1")
while(i != 10) do puts(i) end # never executes

puts( "\nwhile not 2")
while(i != 10) # do # never executes
  puts(i)
  i += 1
end

puts( "\nwhile not 3")
puts(i) while( i != 10) # never executes

puts( "\nwhile not 4")
begin                   # executes once
  puts(i)
end while(i != 10)
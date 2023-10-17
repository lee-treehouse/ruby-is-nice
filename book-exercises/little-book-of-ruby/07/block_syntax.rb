puts( "do..end" )
puts( "integers" )
[1, 2, 3].each do |x| puts(x) end

puts( "\narrays of integers")
[[1, 2, 3], [3, 4, 5], [6, 7, 8]].each do 
  |a, b, c| 
    puts( "#{a}, #{b}, #{c}" ) 
end

puts( "\n{..}" )
puts( "integers" )

[1, 2, 3].each{ |x| puts( x ) }

puts( "\narrays of integers")
[[1, 2], [3, 4, 5], [6, 7, 8]].each{ 
  |a, b, c| 
    puts( "#{a}, #{b}, #{c}" ) 
}

puts( "\narray of arrays")
[[1, 2, 3], [3, 4, 5], [6, 7, 8]].each{ 
  |a| 
    puts( "#{a}" ) 
}
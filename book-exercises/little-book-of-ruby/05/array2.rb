def hello
  return "hello world"
end

x = [1+2, hello,  Dir.entries(".")]
p( x )

y = %w( this is an array of strings )
p( y )

a = Array.new
puts( "Array.new : " << a.inspect )

a = Array.new(2)
puts( "Array.new(2) : " << a.inspect )

a = Array.new(2,"hello world")
p( a )

a = Array.new( 2 )
a[0]= Array.new( 2, 'hello' )
a[1]= Array.new( 2, 'world ')
p( a )

a = [[1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]]
p( a )

a = Array.new( [1, 2, 3] )
p( a )

# Note: in the above example, if you pass an array to new() without
# putting it in round brackets, you must leave a space between
# 'new' and the opening square bracket.
# This works:
#  a = Array.new [1,2,3]
# This doesn't!
#  a = Array.new[1,2,3]
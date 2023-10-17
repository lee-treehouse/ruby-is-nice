puts "hiya"
x = 50
y = 20 

# if x == 10 then y = 3 end

# Or like this, can remove then if the block is split over multiple lines
# if x == 10  
#     y = 3 
# end


# making it clear that yous should mix up assignment and comparison
# == / =
if x == 10 then y = 3 
elsif x == 5 then y = 4
else y = 5
end

p y
# example given about p versus print and nil

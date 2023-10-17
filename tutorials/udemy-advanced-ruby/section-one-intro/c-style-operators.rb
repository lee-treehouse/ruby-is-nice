# c style operators don't always produce the same results
# as english language operators

# specifically, operator precedence is different

# i've pasted the example below and run it but lets be real, I would use brackets for clarity 
# and the result is correct either way if I do so

# The Book of Ruby - http://www.sapphiresteel.com

def dayIs( aDay )
	working_overtime = true
	if aDay == 'Saturday' or aDay == 'Sunday' and not working_overtime
		daytype = 'holiday'
		puts( "Hurrah!" )
	else
		daytype = 'working day'
	end
	return daytype
end

# Different operators produce different reeults
def dayIs2( aDay )
	working_overtime = true
	if aDay == 'Saturday' || aDay == 'Sunday' &&  !working_overtime # note: can't use 'not' here ie must use "!" 
		daytype = 'holiday'
		puts( "Hurrah!" )
	else
		daytype = 'working day'
	end
	return daytype
end



day1 = "Monday"
day2 = "Saturday"
print(day1 + " is a " + dayIs( day1 ) + "\n" )
print(day2 + " is a " + dayIs( day2 ) + "\n" )
print(day1 + " is a " + dayIs2( day1 ) + "\n" )
print(day2 + " is a " + dayIs2( day2 ) + "\n" )
# I confess I am not sure why we'd use unless

# The unless test here is equivalent to...
# if !(aDay == 'Saturday' or aDay == 'Sunday')
def dayIs( aDay )
	unless aDay == 'Saturday' or aDay == 'Sunday'
		daytype = 'weekday'
	else
		daytype = 'weekend'
	end
	return daytype
end



day1 = "Monday"
day2 = "Saturday"
print(day1 + " is a " + dayIs( day1 ) + "\n" )
print(day2 + " is a " + dayIs( day2 ) + "\n" )
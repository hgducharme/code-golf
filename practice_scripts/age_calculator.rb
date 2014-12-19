puts
puts "We're going to calculate how old you are in seconds, minutes and hours! Please format your birthday like so: MM/DD/YYYY"
puts "Type in the expected format for your birthday to confirm that you are ready. (Hint: MM/DD/YYYY)"
response = gets.chomp.downcase
while (response != "mm/dd/yyyy")
	puts "You didn't type: MM/DD/YYYY !"
	puts "Try again:"
	response = gets.chomp.downcase
end

puts "Please type in the month (MM) that you were born." 
month = gets.chomp
month_invalid = (month.length != 2 || month.respond_to?(:to_i) == false || (month.to_i <= 0 || month.to_i > 12)) ? true : false

puts "Please type in the day (DD) that you were born." 
day = gets.chomp
day_invalid = (day.length != 2 || day.respond_to?(:to_i) == false || (day.to_i <= 0 || day.to_i > 31)) ? true : false

puts "Please type in the year (YYYY) that you were born." 
year = gets.chomp
year_invalid = (year.length != 4 || year.respond_to?(:to_i) == false || (year.to_i <= 0 || year.to_i > 2014)) ? true : false

is_invalid = (month_invalid || day_invalid || year_invalid) ? true : false

unless is_invalid
	month_i = month.to_i
	day_i = day.to_i
	year_i = year.to_i

	now = Time.now
	birthday = Time.new(year_i, month_i, day_i, 12)
	age = now - birthday

	minutes = age / 60
	hours = minutes / 60

	puts ">>> You are #{age.floor.to_s} seconds old!"
	puts ">>> You are #{minutes.floor.to_s} minutes old!"
	puts ">>> You are #{hours.floor.to_s} hours old!"
else
	puts "Sorry, you did not enter your birthday correctly, please try again!"
end
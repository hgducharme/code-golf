def bottles_of_beer number
	original_number = number
	while (number != 1)
		puts "#{number} bottles of beer on the wall, #{number} bottles of beer."
		number -= 1
		puts "Take one down and pass it around, #{number} bottles of beer on the wall."
	end

	if (number == 1)
		puts "1 bottle of beer on the wall, #{number} bottle of beer."
		puts "Take one down and pass it around, no more bottles of beer on the wall."
		puts "No more bottles of beer on the wall, no more bottles of beer."
		puts "Go to the store and buy some more, #{original_number} bottles of beer on the wall"
	end
end

puts bottles_of_beer 99
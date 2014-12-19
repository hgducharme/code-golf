def find_substrings
	puts "Enter a string to find out how many substrings are found within it:"
	words = gets.chomp.downcase.split(' ') #.gsub(/\W+/, '')

	substring_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
	substring_frequency = Hash.new


	words.each do |word|
		potential_substring = Array.new

		# Go through each letter within the word
		letters = word.split('')
		letters.each_with_index do |letter, index|
			# Iterate through letters array, and add letters to initial letter
			word.length.times do |x|
				potential_substring << letter + letters[(index+1)..-(x)].join('')
			end
		end 

		puts potential_substring

		potential_substring.each do |substring|
			if substring_dictionary.include?(substring)
				if substring_frequency.include?(substring)
					substring_frequency[substring] += 1
				else
					substring_frequency[substring] = 1
				end
			end 	# End substring_dictionary.include? IF statement
		end 	# End potential_substring.each iteration 

	end 	# End word.each iteration

	puts substring_frequency
end

find_substrings
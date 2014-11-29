def find_substrings
	puts "Enter a string to find out how many substrings are found within it:"
	words = gets.chomp.split('').gsub(/\W+/, '')

	substring_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


	words.each do |word|
		potential_substring = Array.new

		# Go through each letter within the word
		letters = word.split('').each_with_index do |letter, index|
 
			letters[(index+1)..-1]

		end

	end
end
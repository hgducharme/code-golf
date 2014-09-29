def echo(string)
	return "#{string}"
end

def shout(string)
	return "#{string.upcase}"
end

def repeat(string, repeat = 2)
	sentence = ""
	count = 1
	until count == repeat
			sentence += "#{string} "
			count += 1
	end

	if count == repeat
		sentence += "#{string}"
	end

	return sentence
end

def start_of_word(string, number_of_letters = 1)
	return string.slice(0...number_of_letters)
end

def first_word(string)
	words = string.split(" ")
	return words[0]
end

def titleize(string)
	words = string.split(" ")
	little_words = ["and", "but", "or", "the", "over", "to", "a"]

	words.map { |word| word.capitalize! unless little_words.include? word }
	words[0].capitalize!
	return words.join(" ")
end
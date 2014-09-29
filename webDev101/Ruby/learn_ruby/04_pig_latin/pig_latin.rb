#Dont be biased by reading the below method. Start creating a new way to do it.










=begin

def translate(phrase)
	vowels = ["a", "e", "i", "o", "u"]

	case phrase
	when (vowels.include? phrase[0])
		return "#{phrase}ay"
	else
		return phrase
	end
end

=end
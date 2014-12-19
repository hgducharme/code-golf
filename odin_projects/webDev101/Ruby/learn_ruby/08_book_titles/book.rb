class Book
	def title=(str)
		words = str.split(" ")
		little_words = ["and", "but", "or", "the", "over", "to", "a", "an"]
		prepositions = ['in', 'before', 'after', 'on', 'beside', 'of']

		words.map { |word| word.capitalize! unless 
			(little_words.include? word) || (prepositions.include? word) }
		words[0].capitalize!

		@title = words.join(" ")
	end

	def title
		@title
	end
end
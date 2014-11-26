class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end

def check_position(fixnum)
	fixnum += 26 if fixnum < 0
	fixnum += 0 if fixnum > 26
	return fixnum
end

def caesar_cipher
	puts "Please type the string that you would like to encrypt:"
	string = gets.chomp
	while string.empty? 
		puts "Your input was empty, please give at least one letter"
		string = gets.chomp
	end

	puts "Type a numeric value for your encryption key:"
	key = gets.chomp.to_i
	while key < 1
		puts "Sorry that was not a valid entry, please enter a non-zero natural number."
		key = gets.chomp.to_i
	end

	lowercase_alphabet = Hash[ ('a'..'z').map.with_index.to_a ]
	uppercase_alphabet = Hash[ ('A'..'Z').map.with_index.to_a ]

	encrypted_letters = string.split('').map do |x|
		if x.is_lower? then
			new_index = (lowercase_alphabet[x] - key)
			new_index = check_position(new_index)
			x = lowercase_alphabet.key(new_index) 

		else x.is_upper?
			new_index = (uppercase_alphabet[x] - key)
			new_index = check_position(new_index)
			x = uppercase_alphabet.key(new_index) 
		end
	end

	puts
	puts "Your encrypted string is: #{encrypted_letters.join('')}"
end

caesar_cipher
def smallest_number
	divisors = (1..20).to_a
	number = 2520

	until divisors.all? { |x| number % x == 0}
		number += 20 
	end

	puts "The smallest multiple of numbers 1 - 20 is: #{number}"
end

smallest_number
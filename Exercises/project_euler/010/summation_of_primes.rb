require 'prime.rb'

def summation_of_primes(max_number)
	summation = Prime.each(max_number - 1).inject { |sum, x| sum += x}
	puts "The sum of all primes below #{max_number} is #{summation}"
end

summation_of_primes(2000000)
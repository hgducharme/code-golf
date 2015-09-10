def prime?(number)
	2.upto( Math.sqrt(number) ) { |x| return false if (number % x == 0) }
	true
end

def nth_prime(n)
	number = 3
	prime_counter = 1

	# If I set it equal to just n, it will output the prime number n + 1, so I subtract one to counter-act that
	until prime_counter == n-1 
		number += 2
		prime_counter += 1 if prime?(number)
	end

	puts "The #{n} prime number is: #{number}"
end

nth_prime(10001)

=begin
Time Metrics:
real	0m0.929s
user	0m0.910s
sys	0m0.015s 
=end
def sum_of_squares
	sum = 0
	1.upto(100) { |x| sum += x**2 }
	return sum
end

def square_of_sum
	sum = 0
	1.upto(100) { |x| sum += x }
	return sum**2
end

puts "The sum of all the squares of numbers from 1-100 is: #{sum_of_squares}"
puts
puts "The square of the sum of all the numbers from 1-100 is: #{square_of_sum}"
puts
puts "The difference between the -sum of the sqaures- and the -square of the sum- is: #{square_of_sum - sum_of_squares}"
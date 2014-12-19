def add(*numbers)
	sum = 0
	numbers.each { |x| sum += x }
	return sum
end

def subtract(*numbers)
	numbers.reduce(:-)
end

def sum(array)
	sum = 0
	array.map { |x| sum += x }
	return sum
end

def multiply(*numbers)
	product = 1
	numbers.each { |x| product *= x }
	return product
end

def power(x, y)
	return (x ** y)
end

def factorial(number)
	if ( number == 0 || number == 1 )
		return 1

	else
		product = 1
		number.downto(1) { |x| product *= x }
		return product
	end
end
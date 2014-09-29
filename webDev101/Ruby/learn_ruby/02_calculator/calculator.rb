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
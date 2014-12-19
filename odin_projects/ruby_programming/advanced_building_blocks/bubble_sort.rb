def bubble_sort(array)
	array.length.times do 
		array.each_with_index do |x, index|
			result = array[index] <=> array[index+1]
			array[index], array[index+1] = array[index+1], array[index] if result == 1
		end
	end

	puts "#{array}"
end

bubble_sort([4,3,78,2,0,2])
bubble_sort([22,66,4,44,5,7,392,22,8,77,33,118,99,6,1,62,29,14,139,2])
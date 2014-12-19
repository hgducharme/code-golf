def special_triplet(sum_of_abc)
	square_root = Math.sqrt(sum_of_abc).floor

	square_root.upto(sum_of_abc/2) do |a|
		(a+1).upto(sum_of_abc/2) do |b|
			
			c = sum_of_abc - a - b
			if (a**2 + b**2 == c**2) && (a + b + c == sum_of_abc)
				puts "The special triplets are: a = #{a}, b = #{b}, and c = #{c}"
				puts "Pythagorean Therom: #{a**2} + #{b**2} = #{c**2} = #{c}"
				puts "The product of abc = #{a * b * c}"
				break
			end

		end
	end
end

special_triplet(1000)
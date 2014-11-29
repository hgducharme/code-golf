def stock_picker
	puts "Please list the stock price for each consecutive day, separated by commas."
	stock_prices = gets.chomp.gsub(/\s+/, "").split(',').map { |price| price.to_i }

	best_days = Array.new
	best_profit, day_to_buy, day_to_sell = 0, 0, 0

	# Go through each stock price
	stock_prices.each_with_index do |price_1, index_1|

		# For each stock price, go through the other prices in the array that come after it
		stock_prices[index_1..-1].each_with_index do |price_2, index_2|
			
			potential_profit = 0
			(potential_profit = price_2 - price_1) if price_1 < price_2

			if potential_profit > best_profit
				best_profit = potential_profit 
				day_to_buy = index_1
				# Add index_2 + index_1 because on each iteration of the first loop (line 9), the number it starts on is considered index 0. Thus, pushing the indexes of the upcoming numbers back by a few places. 
				day_to_sell = (index_2 + index_1)
			end

		end
	end

	puts 
	puts "The best day to buy the stock was on day #{day_to_buy}, and the best day to sell was on day #{day_to_sell}. Yielding a total of $#{best_profit} in profits."
end

stock_picker
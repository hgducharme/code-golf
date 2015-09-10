class Integer
  def palindrome?
    digits = self.to_s.split('')
    return digits == digits.reverse
  end
end

largest_palindrome = 0
(100..999).each do |a|
  (a..999).each do |b|
    product = a * b
    if product > largest_palindrome and product.palindrome?
      largest_palindrome = product
    end
  end
end
puts "The largest palindrome is: #{largest_palindrome}"
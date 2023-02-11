def divider_quantity_not_3(number)
	quantity = 0
	2.upto(number-1) do |divider|
		if 0 == number % divider
			if 0 != divider % 3
				quantity += 1
			end
		end
	end
	return quantity
end

puts "#{divider_quantity_not_3(15)}"
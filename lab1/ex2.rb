def divider_quantity_not_3(number)
	temp_number = number.abs
	quantity = 0
	2.upto(temp_number-1) do |divider|
		if 0 == temp_number % divider
			if 0 != divider % 3
				quantity += 1
			end
		end
	end
	return quantity
end

puts "#{divider_quantity_not_3(-15)}"

def minimal_odd_digit(number)
	min = 11
	temp_number = number.abs
	until 0 == temp_number
		digit = temp_number % 10
		if 1 == digit % 2
			if min > digit
				min = digit
			end
		end
		temp_number /= 10
	end
	if 11 == min
		return -1
	else
		return min
	end
end

puts "#{minimal_odd_digit(-84862)}"
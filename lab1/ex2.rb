###### METHOD 1 ######

def divider_not_3_quantity(number)
	temp_number = number.abs # get absolute value for exclude incorrect work with negative values
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

puts "#{divider_not_3_quantity(-15)}" # test call

###### METHOD 2 ######

def minimal_odd_digit(number)
	min = 11
	temp_number = number.abs # get absolute value for exclude incorrect work with negative values
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

puts "#{minimal_odd_digit(-84862)}" # test call

###### METHOD 3 ######

### Auxiliary methods

def digit_sum(number)
	sum = 0
	temp_number = number.abs # get absolute value for exclude incorrect work with negative values
	begin
		sum += temp_number % 10
		temp_number /= 10
	end while temp_number !=0
	return sum
end

def digit_multiply(number)
	sum = 1
	temp_number = number.abs # get absolute value for exclude incorrect work with negative values
	begin
		sum *= temp_number % 10
		temp_number /= 10
	end while temp_number !=0
	return sum
end

# Great Common Divider function
def GCD(number1, number2)
	temp1 = number1.abs # get absolute value for exclude incorrect work with negative values
	temp2 = number2.abs
	
	while temp1 != temp2
		if temp1 < temp2
			transfer = temp1
			temp1 = temp2
			temp2 = transfer
		end
		temp1 -= temp2
	end
	return temp1
end

### Main method

=begin
all dividers in sum must begin
	coprime to digits sum
	not comprime to digits multiplication
=end
def divider_sum_spec(number)
	temp_number = number.abs # get absolute value for exclude incorrect work with negative values
	sum = 0
	number_digit_sum = digit_sum(number)
	number_digit_multiply = digit_multiply(number)
	2.upto(temp_number-1) do |divider|
		if 0 == temp_number % divider
			if 1 == GCD(divider, number_digit_sum) and 1 != GCD(divider, number_digit_multiply)
				sum += divider
			end
		end
	end
	return sum
end

puts "#{divider_sum_spec(14)}" # test call
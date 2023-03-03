a = []



def find_min_in_array(array)
	if array.empty? #if array has no elements, it has no min
		return -1
	end
	min = array[0]
	for number in array
		if nil == number # check for bad values
			return -1
		end
		if number < min
			min = number
		end
	end
	return min
end

b = find_min_in_array(a)
puts b
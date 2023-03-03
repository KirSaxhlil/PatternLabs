def find_min_in_array(array)
	if array.empty? #if array has no elements, it has no min
		return nil
	end
	min = array[0]
	for number in array
		if nil == number # check for bad values
			return nil
		end
		begin
			if number < min
				min = number
			end
		rescue ArgumentError  #check for non one-type array
			return nil
		end
	end
	return min
end

def find_max_in_array(array)
	if array.empty? #if array has no elements, it has no max
		return nil
	end
	max = array[0]
	for number in array
		if nil == number # check for bad values
			return nil
		end
		begin
			if number > max
				max = number
			end
		rescue ArgumentError #check for non one-type array
			return nil
		end
	end
	return max
end

def find_first_positive_value_index(array)
	if array.empty? #if array has no elements, it has no max
		return nil
	end
	for index in 0..array.length-1
		begin
			if array[index] > 0
				return index
			end
		rescue ArgumentError #check for non numerical value
			return nil
		end
	end
	return -1 # if array has no positive elements
end

def read_file_to_array(filename)
	array = []
	begin
		File.open(filename, "r") do |file|
			file.each_line { |x| array.push(x.to_i) }
		end
	rescue Errno::ENOENT
	end
	return array
end

a = [2,4,5,6]
array = read_file_to_array("filet.txt")
puts array
b = find_first_positive_value_index(array)
puts b
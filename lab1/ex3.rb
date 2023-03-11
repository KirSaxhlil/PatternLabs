def find_min_in_array(array)
	if array.empty? #if array has no elements, it has no min
		raise StandardError.new "Array is empty."
	end
	min = array[0]
	for number in array
		if nil == number # check for bad values
			raise StandardError.new "Bad value in array."
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
		raise StandardError.new "Array is empty."
	end
	max = array[0]
	for number in array
		if nil == number # check for bad values
			raise StandardError.new "Bad value in array."
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
		raise StandardError.new "Array is empty."
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

array = read_file_to_array(ARGV[1])
if !array.empty?
	case ARGV[0]
		when "find_min_in_array"
			puts find_min_in_array(array)
		when "find_max_in_array"
			puts find_max_in_array(array)
		when "find_first_positive_value_index"
			puts find_first_positive_value_index(array)
		else
			puts "Wrong method name."
	end
else
	puts "File is empty or not exist."
end
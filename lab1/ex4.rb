def find_one_different(array)
	if array.empty?
		return -1
	end
	test = array[0]
	array.delete(test)
	if array.length == 1
		return array[0]
	else
		return test
	end
end

array = [2,1,1,1,1,1,1,1]

puts find_one_different(array)
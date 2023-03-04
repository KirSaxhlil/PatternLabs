def find_one_different(array)
	if array.empty? #we can't find anything in empty array
		return -1
	end
	test = array[0]
	array.delete(test)
	if array.length == 1 #if one last, this last is different, in another way was deleted only one item< which is different
		return array[0]
	else
		return test
	end
end

def find_two_mins(array)
	if array.empty? #we can't find anything in empty array
		return -1
	end
	mins = []
	mins << array.min
	array.delete(mins[0])
	if array.empty? #for those ways, when original array collected only one item, or many items, but they all was same
		return mins
	end
	mins << array.min
	return mins
end

array1 = [2,1,1,1,1,1,1,1]
array2 = [3,4,4,3,5,1,1,2,2,3,4]

#puts find_one_different(array1)
puts find_two_mins(array2)
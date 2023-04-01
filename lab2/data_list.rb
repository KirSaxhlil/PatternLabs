class DataList
	def initialize(objects)
		self.array = objects
		@selected = []
	end
	
	### OBJECT PUBLIC METHODS
	public
	
	def select(number)
		index = self.selected.find_index(number)
		if index == nil
			self.selected.push(number)
		else
			self.selected.delete_at(index)
		end
	end
	
	def get_selected()
		return self.selected
	end
	
	def get_names()
		return ["№"] + get_names_inner()
	end
	
	def get_data()
		matrix = []
		index = 0
		self.array.each { |item|
			matrix.push( [index] + get_data_inner(item) )
			index += 1
		}
		return DataTable.new(matrix)
	end
	
	def array=(new_array)
		new_array.each { |item|
			if item.class != item_class()
				raise ArgumentError.new "All elements must be #{item_class()} class."
			end
		}
		@array = new_array
	end
	
	### OBJECT PRIVATE METHODS
	private
	
	attr_reader :selected, :array, :item_class
	
	def get_data_inner(item)
		return []
	end
	
	def get_names_inner()
		return []
	end
	
	def item_class()
		return Object
	end
end
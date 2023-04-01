class DataList
	def initialize(objects)
		@array = objects
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
	
	### OBJECT PRIVATE METHODS
	private
	
	attr_reader :selected, :array
	
	def get_data_inner(item)
		return []
	end
	
	def get_names_inner()
		return []
	end
end
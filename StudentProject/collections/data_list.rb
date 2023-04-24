require_relative "../gui/elements/fx_table_students.rb"
class DataList
	### GENERATED
	private attr_reader :selected, :array
	
	### INITIALIZE
	private
	
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
		ids = []
		selected.each { |item|
			ids += [array[item].id]
		}
		return ids
	end
	
	def get_names()
		return ["№"] + get_names_inner()
	end
	
	def get_data()
		matrix = []
		index = 1
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

	def notify(target)
		target.set_table_params(get_names(), array.length)
		target.set_table_data(get_data())
	end
	
	### OBJECT PRIVATE METHODS
	private
	
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
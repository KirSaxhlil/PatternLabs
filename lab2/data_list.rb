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
		raise NotImplementedError.new "Calling abstract method" # kinda abstract method
	end
	
	def get_data()
		raise NotImplementedError.new "Calling abstract method" # kinda abstract method
	end
	
	### OBJECT PROTECTED METHODS
	protected
	
	attr_reader :array
	
	### OBJECT PRIVATE METHODS
	private
	
	attr_reader :selected
end
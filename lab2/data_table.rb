class DataTable
	### INITIALIZE
	private
	
	def initialize(matrix)
		@matrix = matrix
	end
	
	### OBJECT PUBLIC METHODS
	public
	
	def get_element(row, column)
		return matrix[row][column]
	end
	
	def rows?()
		return self.matrix.length
	end
	
	def columns?()
		return self.matrix[0].length
	end
	
	### OBJECT PRIVATE METHODS
	private
	
	attr_reader :matrix
end
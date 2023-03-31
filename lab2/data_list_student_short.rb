require_relative "data_list.rb"
require_relative "student_short.rb"
require_relative "data_table.rb"

class DataListStudentShort < DataList
	
	def get_names()
		return ["Short name", "Git", "Contact"]
	end
	
	def get_data()
		matrix = []
		index = 0
		self.array.each { |item|
			matrix.push( [index] + item.get_info().split(';')[1..-1] )
			index += 1
		}
		return DataTable.new(matrix)
	end
end
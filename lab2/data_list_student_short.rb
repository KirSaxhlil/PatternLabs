require_relative "data_list.rb"
require_relative "student_short.rb"

class DataListStudentShort < DataList
	
	private
	def get_names_inner()
		return ["Short name", "Git", "Contact type", "Contact"]
	end
	
	def get_data_inner(item)
		attributes = item.get_info().split(';')[1..-1]
		return attributes[0..-2] + attributes[-1].split(':')
	end
	
	def item_class()
		return StudentShort
	end
end
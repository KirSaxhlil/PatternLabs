require_relative "data_list.rb"
require_relative "../student/student_short.rb"

class DataListStudentShort < DataList
	
	### OBJECT PRIVATE METHODS
	private
	def get_names_inner()
		return ["ФИО", "Гит", "Контакт"]
	end
	
	def get_data_inner(item)
		attributes = item.get_info().split(';')[1..-1]
		return attributes[0..-2] + [attributes[-1].split(':')[1]]
	end
	
	def item_class()
		return StudentShort
	end
end
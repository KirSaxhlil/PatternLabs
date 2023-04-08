require_relative "students_list.rb"

class StudentsListTxt < StudentsList

	def read_file(path)
		File.open(path, "r") do |file|
			file.each_line { |x| self.objects.push(Student.new_string(x[0..-2])) }
		end
	end
	
	def write_file(path)
		File.open(path, "w") do |file|
			self.objects.each { |obj| file.write(obj.get_info_full+"\n") }
		end
	end
	
end
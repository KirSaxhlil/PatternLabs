require_relative "file_operator.rb"

class FileOperatorTXT < FileOperator
	### PUBLIC OBJECT METHODS
	public
	
	def read_file(path)
		objects = []
		File.open(path, "r") do |file|
			file.each_line { |x| objects.push(Student.new_string(x[0..-2])) }
		end
		return objects
	end
	
	def write_file(path, objects)
		File.open(path, "w") do |file|
			objects.each { |obj| file.write(obj.get_info_full+"\n") }
		end
	end
	
end
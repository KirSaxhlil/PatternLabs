require_relative "file_operator.rb"
require "json"

class FileOperatorJSON < FileOperator
	### PUBLIC OBJECT METHODS
	public
	
	def read_file(path)
		objects = []
		File.open(path, "r") do |file|
			file.each_line { |x| objects.push(Student.new_hash(JSON.parse(x).transform_keys(&:to_sym))) }
		end
		return objects
	end
	
	def write_file(path, objects)
		File.open(path, "w") do |file|
			objects.each { |obj| file.write(JSON.generate(obj.to_hash)+"\n") }
		end
	end
	
end
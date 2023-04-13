require_relative "file_operator.rb"
require "yaml"

class FileOperatorYAML < FileOperator
	### PUBLIC OBJECT METHODS
	public
	
	def read_file(path)
		objects = []
		YAML.load_stream(File.read(path)) { |obj|
			objects.push(obj)
		}
		return objects
	end
	
	def write_file(path, objects)
		File.open(path, "w") do |file|
			objects.each { |obj| file.write(obj.to_yaml) }
		end
	end
	
end
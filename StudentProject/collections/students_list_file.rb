require_relative "../student/student.rb"
require_relative "../student/student_short.rb"
require_relative "data_list_student_short.rb"

class StudentsListFile
	### GENERATED
	private attr_reader :objects
	public attr_reader :file_operator
	
	### INITIALIZE
	private
	
	def initialize()
		@objects = []
	end
	
	### PUBLIC OBJECT METHODS
	public
	
	def read_file(path)
		@objects = self.file_operator.read_file(path)
	end
	
	def write_file(path)
		self.file_operator.write_file(path, self.objects)
	end
	
	def file_operator=(object)
		@file_operator = object
	end
	
	def [](id)
		self.objects.each { |obj|
			if obj.id == id then return obj end
		}
		return nil
	end
	
	def get_k_n_student_short_list(k, n, input = nil)
		output = []
		(0..n-1).each { |index|
			obj = self.objects[(k*n)+index]
			if obj != nil
				output.push(StudentShort.new_object(obj))
			end
		}
		if input == nil
			return DataListStudentShort.new(output)
		else
			input.array = output
		end
	end
	
	def sort()
		self.objects.sort_by!(&:get_family_and_initials)
	end
	
	def add_student(object)
		object.id = self.objects.max_by(&:id).id+1
		self.objects.push(object)
	end
	
	def remove_student(id)
		self.objects.delete(self.objects.find { |obj|
			obj.id == id
		})
	end
	
	def replace_student(id, object)
		object.id = id
		self[id] = object
	end
	
	def get_student_short_count()
		return self.objects.length
	end
	
	### PRIVATE OBJECT METHODS
	private
	
	def []=(id, object)
		index = 0
		self.objects.each { |obj|
			if obj.id == id then self.objects[index] = object end
			index += 1
		}
	end
end
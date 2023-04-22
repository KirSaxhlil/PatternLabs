require_relative "students_list_db.rb"
require_relative "students_list_file.rb"

class StudentsListDBAdapterToFile < StudentsListDB
    ### GENERATED
    private attr_accessor :list
    private attr_accessor :path
	
	### INITIALIZE
	private
	
	def initialize(operator, path)
		self.list = StudentsListFile.new()
        self.list.file_operator = operator
        self.path = path
	end

	### PUBLIC OBJECT METHODS
	public
	
	def [](id)
        self.list.read_file(path)
		return self.list[id]
	end
	
	def get_k_n_student_short_list(k, n, input = nil)
        self.list.read_file(path)
		self.list.get_k_n_student_short_list(k,n,input)
	end
	
	def add_student(object)
        self.list.read_file(path)
		self.list.add_student(object)
        self.list.write_file(path)
	end
	
	def remove_student(id)
        self.list.read_file(path)
		self.list.remove_student(id)
        self.list.write_file(path)
	end
	
	def replace_student(id, object)
        self.list.read_file(path)
		self.list.replace_student(id, object)
        self.list.write_file(path)
	end
	
	def get_count()
        self.list.read_file(path)
		self.list.get_count()
	end
end
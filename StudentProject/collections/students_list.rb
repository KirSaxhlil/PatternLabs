require_relative "students_list_db.rb"
require_relative "students_list_db_adapter_to_file.rb"
require_relative "../data operators/file_operators.rb"

class StudentsList
    ### GENERATED
    private attr_reader :list

	### INITIALIZE
	private
	
	def initialize(list)
		@list = list
	end

	### CONSTRUCTOR METHODS
	private_class_method :new
	public

	def self.new_db()
		new(StudentsListDB.new())
	end

	def self.new_file(path)
		type = (path[/\.[a-zA-Z0-9]*$/][1..-1]).downcase()
		case type
			when "txt"
				operator = FileOperatorTXT.new()
			when "yaml"
				operator = FileOperatorYAML.new()
			when "json"
				operator = FileOperatorJSON.new()
		end
		new(StudentsListDBAdapterToFile.new(operator, path))
	end

	### PUBLIC OBJECT METHODS
	public
	
	def [](id)
		return self.list[id]
	end
	
	def get_k_n_student_short_list(k, n, input = nil)
		self.list.get_k_n_student_short_list(k,n,input)
	end
	
	def add_student(object)
		self.list.add_student(object)
	end
	
	def remove_student(id)
		self.list.remove_student(id)
	end
	
	def replace_student(id, object)
		self.list.replace_student(id, object)
	end
	
	def get_count()
		self.list.get_count()
	end

	def notify(target)
		target.refresh_pages_data(get_count())
	end
end
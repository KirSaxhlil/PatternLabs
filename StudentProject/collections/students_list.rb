require_relative "students_list_db.rb"

class StudentsList
    ### GENERATED
    public attr_accessor :List
	### INITIALIZE
	private
	
	def initialize(List)
		self.List = List
	end

	### PUBLIC OBJECT METHODS
	public
	
	def [](id)
		return self.List[i]
	end
	
	def get_k_n_student_short_list(k, n, input = nil)
		self.List.get_k_n_student_short_list(k,n,input)
	end
	
	def add_student(object)
		self.List.add_student(object)
	end
	
	def remove_student(id)
		self.List.remove_student(id)
	end
	
	def replace_student(id, object)
		self.List.replace_student(id, object)
	end
	
	def get_count()
		self.List.get_count()
	end
end
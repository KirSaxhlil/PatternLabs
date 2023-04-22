require_relative "../student/student.rb"
require_relative "../student/student_short.rb"
require_relative "data_list_student_short.rb"
require_relative "../data operators/db_operator.rb"
require "sqlite3"

class StudentsListDB
	### INITIALIZE
	private
	
	def initialize()
		
	end

	### PUBLIC OBJECT METHODS
	public
	
	def [](id)
		return Student.new_hash(DBOperator.instance.get_student(id))
	end
	
	def get_k_n_student_short_list(k, n, input = nil)
		result = DBOperator.instance.get_k_n_students(k,n)
		output = []
		result.each { |student|
			#puts row
			output.push(StudentShort.new_object(Student.new_hash(student)))
		}
		if input == nil
			return DataListStudentShort.new(output)
		else
			input.array = output
		end
	end
	
	def add_student(object)
		DBOperator.instance.add_student("'#{object.name}', '#{object.family}', '#{object.patronymic}', '#{object.git}', '#{object.phone_number}', '#{object.telegram}', '#{object.email}'")
	end
	
	def remove_student(id)
		DBOperator.instance.remove_student(id)
	end
	
	def replace_student(id, object)
		DBOperator.instance.replace_student(id, "name='#{object.name}', family='#{object.family}', patronymic='#{object.patronymic}',
			git='#{object.git}', phone_number='#{object.phone_number}', telegram='#{object.telegram}', email='#{object.email}'")
	end
	
	def get_count()
		return DBOperator.instance.get_count()
	end
end
require_relative "../student/student.rb"
class DBOperator
    ### GENERATED
	private attr_reader :connection

    ### INITIALIZE
	private
	
	def initialize()
		
	end
	
	### CONSTRUCTOR METHODS
	private_class_method :new

    ### PUBLIC OBJECT METHODS
    public

    def get_student(id)
        return Student.new_hash(self.connection.query("SELECT * FROM Student WHERE ID=#{id}").next.transform_keys(&:to_sym))
    end

    def get_k_n_students(k, n)
		result = self.connection.query("SELECT * FROM Student LIMIT #{k*n},#{n}")
		output = []
		result.each { |row|
			#puts row
			output.push(Student.new_hash(row.transform_keys(&:to_sym)))
		}
		return output
	end

    def add_student(object)
        self.connection.execute("INSERT INTO Student (name, family, patronymic, git, phone_number, telegram, email)
		VALUES ('#{object.name}', '#{object.family}', '#{object.patronymic}', '#{object.git}', '#{object.phone_number}', '#{object.telegram}', '#{object.email}')")
	end

    def remove_student(id)
		self.connection.execute("DELETE FROM Student WHERE id=#{id}")
	end

    def replace_student(id, object)
		self.connection.execute("UPDATE Student SET name='#{object.name}', family='#{object.family}', patronymic='#{object.patronymic}',
			git='#{object.git}', phone_number='#{object.phone_number}', telegram='#{object.telegram}', email='#{object.email}'
			WHERE id=#{id}")
	end

    def get_count()
		return self.connection.query("SELECT COUNT(*) FROM Student").next["COUNT(*)"]
	end

    def connect(database)
		@connection = SQLite3::Database.open(database)
		@connection.results_as_hash = true
	end

    ### PUBLIC CLASS METHODS
	public

	def self.instance
		if @instance == nil
			@instance = new()
		end
		return @instance
	end

	def self.connect(database)
		self.instance.connect(database)
	end
end
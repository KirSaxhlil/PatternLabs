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
        return self.connection.query("SELECT * FROM Student WHERE ID=#{id}").next.transform_keys(&:to_sym)
    end

    def get_k_n_students(k, n)
		result = self.connection.query("SELECT * FROM Student LIMIT #{k*n},#{n}")
		output = []
		result.each { |row|
			output.push(row.transform_keys(&:to_sym))
		}
		return output
	end

    def add_student(fields)
        self.connection.execute("INSERT INTO Student (name, family, patronymic, git, phone_number, telegram, email)
		VALUES (#{fields})")
	end

    def remove_student(id)
		self.connection.execute("DELETE FROM Student WHERE id=#{id}")
	end

    def replace_student(id, fields)
		self.connection.execute("UPDATE Student SET #{fields}
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
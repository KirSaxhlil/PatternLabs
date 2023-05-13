class DBOperator
    ### GENERATED
	public attr_reader :connection

    ### INITIALIZE
	private
	
	def initialize()
		
	end
	
	### CONSTRUCTOR METHODS
	private_class_method :new

    ### PUBLIC OBJECT METHODS
    public

    def get_element(table, id)
        return self.connection.execute("SELECT * FROM #{table} WHERE ID=#{id};COMMIT;").next.transform_keys(&:to_sym) #query
    end

    def get_k_n_elements(table, k, n)
		result = self.connection.execute("SELECT * FROM #{table} LIMIT #{k*n},#{n};COMMIT;") #query
		output = []
		result.each { |row|
			output.push(row.transform_keys(&:to_sym))
		}
		return output
	end

    def add_element(table, hash)
		fields = "#{hash.keys[0]}"
		(1..hash.keys.length-1).each { |index|
			fields += ", #{hash.keys[index]}"
		}

		values = "'#{hash.values[0]}'"
		(1..hash.values.length-1).each { |index|
			values += ", '#{hash.values[index]}'"
		}

        self.connection.execute("INSERT INTO #{table} (#{fields})
		VALUES (#{values});COMMIT;")
	end

    def remove_element(table, id)
		self.connection.execute("DELETE FROM #{table} WHERE id=#{id};COMMIT;")
	end

    def replace_element(table, id, hash)
		fields = "#{hash.keys[0]}='#{hash.values[0]}'"
		(1..hash.keys.length-1).each { |index|
			fields += ", #{hash.keys[index]}='#{hash.values[index]}'"
		}

		self.connection.execute("UPDATE #{table} SET #{fields}
			WHERE id=#{id};COMMIT;")
	end

    def get_count(table)
		return self.connection.query("SELECT COUNT(*) FROM #{table};COMMIT;").next["COUNT(*)"] #query
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
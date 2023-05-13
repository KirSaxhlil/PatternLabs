class BaseStudent
	### GENERATED
	public attr_reader :id, :phone_number, :email, :telegram, :git
	
	### INITIALIZE
	private
	
	def initialize(hash)
		if hash[:id] == nil
			self.id = 0
			#raise ArgumentError.new "Student should has id."
		else
			self.id = hash[:id]
		end
		
		set_contacts({phone_number:hash[:phone_number], email:hash[:email], telegram:hash[:telegram]})
		self.git = hash[:git]
	end
	
	### CONSTRUCTOR METHODS
	private_class_method :new
	
	public
	def self.new_hash(hash)
		return new(hash)
	end
	
	### OBJECT PUBLIC METHODS
	public
	
	def get_info
		return "#{self.id}"
	end
	
	def get_one_contact()
		if self.phone_number != nil then return {type:"phone_number", contact:self.phone_number}
		elsif self.telegram != nil then return {type:"telegram", contact:self.telegram}
		elsif self.email != nil then return {type:"email", contact:self.email}
		else return nil
		end
	end
	
	def set_contacts(contacts)
		self.email = contacts[:email] if(contacts[:email] != nil)
		self.phone_number = contacts[:phone_number] if(contacts[:phone_number] != nil)
		self.telegram = contacts[:telegram] if(contacts[:telegram] != nil)
	end
	
	def git=(new_git)
		if new_git == nil or new_git == "" # if we set nil, then we clear git
			@git = nil
		elsif Student.is_git(new_git)
			@git = new_git
		else
			raise ArgumentError.new "Wrong git user address."
		end
	end
	
	def id=(new_id)
		if new_id.class == Integer
			@id = new_id
		elsif new_id.class == String
			if new_id.match(/\D/)
				raise ArgumentError.new "Id must be Integer"
			end
			self.id = new_id.to_i
		else
			raise ArgumentError.new "Id must be Integer"
		end
	end
	
	def git?()
		return git != nil
	end
	
	def phone_number?()
		return phone_number != nil
	end
	
	def email?()
		return email != nil
	end
	
	def telegram?()
		return telegram != nil
	end
	
	def contacts?()
		return ( phone_number? or email? or telegram? )
	end
	
	def validate()
		return ( git? and contacts? )
	end
	
	def to_hash()
		hash = {}
		instance_variables.each { |var|
			hash[var.to_s.delete("@")] = instance_variable_get(var)
		}
		return hash
	end
	
	### OBJECT PRIVATE METHODS
	private
	
	def phone_number=(new_number)
		if new_number.class == String
			if new_number.empty?
				self.phone_number = nil
			elsif Student.is_phone_number(new_number)
				@phone_number = new_number
			else
				raise ArgumentError.new "#{new_number} is not a phone number."
			end
		elsif new_number.class == Integer
			self.phone_number = (new_number.to_s) #we are integers haters
		elsif new_number == nil
			@phone_number = nil
		else
			raise TypeError.new "Phone number must be String or Integer."
		end
	end
	
	def email=(new_email)
		if new_email == nil or new_email == "" # if we set nil, then we clear email
			@email = nil
		elsif Student.is_email(new_email)
			@email = new_email
		else
			raise ArgumentError.new "Wrong email address."
		end
	end
	
	def telegram=(new_telegram)
		if new_telegram.class == String
			if new_telegram.empty?
				self.telegram = nil
				return
			end
			dog = false
			if new_telegram[0] == '@' #check for first staying @
				dog = true
			end
			if Student.is_telegram(new_telegram)
				@telegram = (if dog then '' else '@' end) + new_telegram
			else
				raise ArgumentError.new  "Wrong telegram user id."
			end
		elsif new_telegram == nil
			@telegram = nil
		else
			raise TypeError.new "Telegram must be String value."
		end
	end
	
	### CLASS METHODS
	public
	
	def self.is_phone_number(string)
		temp_string = string
		if string[0] == '+'
			temp_string = string[1..-1]
		end
		if temp_string.match?(/\D/)
			return false
		end
		if temp_string.length != 11
			return false
		end
		return true
	end
	
	def self.is_email(string)
		# before and after @ need any letter, digit or _, but at least 1 letter, after XX@XX needs dot, and after only letters
		return string.match?(/^\w*[a-zA-Z]+\w*@\w*[a-zA-Z]+\w*\.[a-zA-Z]+$/)
	end
	
	def self.is_git(string)
		# at begin may be https://, after need github.com/ or gitlab.com/, after we need user id
		return string.match?(/^(https\:\/\/)?((github)|(gitlab))\.(com)\/\w+$/)
	end
	
	def self.is_telegram(string)
		temp_string = string
		if temp_string[0] == '@' #check for first staying @
			temp_string = string[1..-1]
		end
		return temp_string.match?(/^\w+$/)
	end
	
end
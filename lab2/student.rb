class Student
	attr_reader :name, :family, :patronymic, :phone_number, :email, :telegram, :git
	
	def initialize(hash)
		#name, family and patronymic are necessary, others optional
		if(hash[:name] == nil or hash[:family] == nil or hash[:patronymic] == nil)
			raise ArgumentError.new "Name, family and patronymic are necessary for constructor."
		end
		def_hash = hash
		def_hash.default = ""
		set_name(new_name:def_hash[:name], new_family:def_hash[:family], new_patronymic:def_hash[:patronymic])
		self.phone_number = def_hash[:phone_number]
		self.email = def_hash[:email]
		self.telegram = def_hash[:telegram]
		self.git = def_hash[:git]
	end
	
	def set_name(hash)
		if hash[:name] != nil #if we not input name, not change this
			if hash[:name].match(/^[a-zA-Z]+$/)
				@name = hash[:name].capitalize
			else
				raise ArgumentError.new "Wrong name."
			end
		end
		if hash[:family] != nil #if we not input family, not change this
			if hash[:family].match(/^[a-zA-Z]+$/)
				@family = hash[:family].capitalize
			else
				raise ArgumentError.new "Wrong family."
			end
		end
		if hash[:patronymic] != "" #if we not input patronymic, not change this
			if hash[:patronymic].match(/^[a-zA-Z]+$/)
				@patronymic = hash[:patronymic].capitalize
			else
				raise ArgumentError.new "Wrong patronymic."
			end
		end
	end
	
	def phone_number=(new_number)
		if new_number.class == String
			if new_number == ""
				@phone_number = ""
				return
			end
			if Student.is_phone_number(new_number)
				@phone_number = new_number
			else
				raise ArgumentError.new "#{new_number} is not a phone number."
			end
		elsif new_number.class == Integer
			self.phone_number = (new_number.to_s) #we are integers haters
		else
			raise TypeError.new "Phone number must be String or Integer."
		end
	end
	
	def email=(new_email)
		if new_email == "" # if we set empty string, then we clear email
			@email = ""
		elsif Student.is_email(new_email)
			@email = new_email
		else
			raise ArgumentError.new "Wrong email address."
		end
	end
	
	def telegram=(new_telegram)
		if new_telegram.class == String
			if new_telegram == ""
				@telegram = "" #clearing telegram field
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
		else
			raise TypeError.new "Telegram must be String value."
		end
	end
	
	def git=(new_git)
		if new_git == "" # if we set empty string, then we clear git
			@git = ""
		elsif Student.is_git(new_git)
			@git = new_git
		else
			raise ArgumentError.new "Wrong git user address."
		end
	end
	
	def get_info
		info = ""
		info += "This is info about: #{self.family} #{self.name} #{self.patronymic}" + "\n"
		info += "Phone number: #{self.phone_number}" + "\n" if self.phone_number != ""
		info += "Email: #{self.email}" + "\n" if self.email != ""
		info += "Telegram: #{self.telegram}" + "\n" if self.telegram != ""
		info += "Git: #{self.git}" + "\n" if self.git != ""
		return info
	end
	
	def self.is_phone_number(string)
		temp_string = string
		if string[0] == '+'
			temp_string = string[1..-1]
		end
		if temp_string.match(/\D/)
			return false
		end
		if temp_string.length != 11
			return false
		end
		return true
	end
	
	def self.is_email(string)
		# before and after @ need any letter, digit or _, but at least 1 letter, after XX@XX needs dot, and after only letters
		return string.match(/^\w*[a-zA-Z]+\w*@\w*[a-zA-Z]+\w*\.[a-zA-Z]+$/)
	end
	
	def self.is_git(string)
		# at begin may be https://, after need github.com/ or gitlab.com/, after we need user id
		return string.match(/^(https\:\/\/)?((github)|(gitlab))\.(com)\/\w+$/)
	end
	
	def self.is_telegram(string)
		temp_string = string
		if temp_string[0] == '@' #check for first staying @
			temp_string = string[1..-1]
		end
		return temp_string.match(/^\w+$/)
	end
	
	def has_git()
		return git != ""
	end
	
	def has_phone_number()
		return phone_number != ""
	end
	
	def has_email()
		return email != ""
	end
	
	def has_telegram()
		return telegram != ""
	end
	
	def has_contact()
		return ( has_phone_number() or has_email() or has_telegram() )
	end
	
	def validate()
		return ( has_git() and has_contact() )
	end
	
	def set_contacts(contacts)
		temp_contacts = contacts
		self.email = temp_contacts[:email] if(temp_contacts[:email] != nil)
		self.phone_number = temp_contacts[:phone_number] if(temp_contacts[:phone_number] != nil)
		self.telegram = temp_contacts[:telegram] if(temp_contacts[:telegram] != nil)
	end
	
end
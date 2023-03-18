class Student
	attr_reader :name, :family, :patronymic, :phone_number, :email, :telegram, :git
	
	def initialize(new_name:, new_family:, new_patronymic:, new_number:"", new_email:"", new_telegram:"", new_git:"")
		#name, family and patronymic are necessary, others optional
		set_name(new_name:new_name, new_family:new_family, new_patronymic:new_patronymic)
		set_phone_number(new_number)
		set_email(new_email)
		set_telegram(new_telegram)
		set_git(new_git)
	end
	
	def set_name(new_name:"", new_family:"", new_patronymic:"")
		if new_name != "" #if we not input name, not change this
			if new_name.match(/^[a-zA-Z]+$/)
				@name = new_name.capitalize
			else
				raise ArgumentError.new "Wrong name."
			end
		end
		if new_family != "" #if we not input family, not change this
			if new_family.match(/^[a-zA-Z]+$/)
				@family = new_family.capitalize
			else
				raise ArgumentError.new "Wrong family."
			end
		end
		if new_patronymic != "" #if we not input patronymic, not change this
			if new_patronymic.match(/^[a-zA-Z]+$/)
				@patronymic = new_patronymic.capitalize
			else
				raise ArgumentError.new "Wrong patronymic."
			end
		end
	end
	
	def set_phone_number(new_number)
		if new_number.class == String
			if new_number == ""
				@phone_number = ""
				return
			end
			plus = false
			temp_number = new_number
			if temp_number[0] == '+' #check for saving first staying plus
				plus = true
				temp_number = temp_number[1..-1]
			end
			if temp_number.match(/\D/)
				raise ArgumentError.new "Wrong number."
			end
			if temp_number.length != 11
				raise ArgumentError.new "Wrong phone number length."
			end
			@phone_number = (if plus then '+' else '' end) + temp_number
		elsif new_number.class == Integer
			set_phone_number(new_number.to_s) #we are integers haters
		else
			raise TypeError.new "Phone number must be String or Integer."
		end
	end
	
	def set_email(new_email)
		if new_email == "" # if we set empty string, then we clear email
			@email = ""
		elsif new_email.match(/^\w*[a-zA-Z]+\w*@\w*[a-zA-Z]+\w*\.[a-zA-Z]+$/) # before and after @ need any letter, digit or _, but at least 1 letter, after XX@XX needs dot, and after only letters
			@email = new_email
		else
			raise ArgumentError.new "Wrong email address."
		end
	end
	
	def set_telegram(new_telegram)
		if new_telegram.class == String
			if new_telegram == ""
				@telegram = "" #clearing telegram field
				return
			end
			dog = false
			if new_telegram[0] == '@' #check for first staying @
				dog = true
			end
			if (if dog then new_telegram[1..-1] else new_telegram end).match(/^\w+$/)
				@telegram = (if dog then '' else '@' end) + new_telegram
			else
				raise ArgumentError.new  "Wrong telegram user id."
			end
		else
			raise TypeError.new "Telegram must be String value."
		end
	end
	
	def set_git(new_git)
		if new_git == "" # if we set empty string, then we clear git
			@git = ""
		elsif new_git.match(/^(https\:\/\/)?((github)|(gitlab))\.(com)\/\w+$/) # at begin may be https://, after need github.com/ or gitlab.com/, after we need user id
			@git = new_git
		else
			raise ArgumentError.new "Wrong git user address."
		end
	end
	
	def GetInfo
		info = ""
		info += "This is info about: #{self.family} #{self.name} #{self.patronymic}" + "\n"
		info += "Phone number: #{self.phone_number}" + "\n" if self.phone_number != ""
		info += "Email: #{self.email}" + "\n" if self.email != ""
		info += "Telegram: #{self.telegram}" + "\n" if self.telegram != ""
		info += "Git: #{self.git}" + "\n" if self.git != ""
		return info
	end
	
end
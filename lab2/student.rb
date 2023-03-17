
class Student
	attr_reader :name, :family, :patronymic, :phone_number, :email, :telegram, :git
	
	def set_name(new_name:"", new_family:"", new_patronymic:"")
		if new_name != "" #if we not input name, not change this
			@name = new_name
		end
		if new_family != "" #if we not input family, not change this
			@family = new_family
		end
		if new_patronymic != "" #if we not input patronymic, not change this
			@patronymic = new_patronymic
		end
	end
	
	def set_phone_number(new_number)
		if new_number.class == String
			plus = false
			if new_number[0] == '+' #check for saving first staying plus
				plus = true
			end
			temp_number = new_number.gsub(/\D/, '') #DELETE ALL NON-DIGIT CHARACTERS
			if temp_number.length != 11
				raise StandardError.new "Wrong phone number length."
			end
			@phone_number = (if plus then '+' else '' end) + temp_number
		elsif new_number.class == Integer
			set_phone_number(new_number.to_s) #we are integers haters
		end
	end
	
	def set_email(new_email)
		if new_email == "" # if we set empty string, then we clear email
			@email = ""
		elsif new_email.match(/^\w*[a-zA-Z]+\w*@\w*[a-zA-Z]+\w*\.[a-zA-Z]+$/) # before and after @ need any letter, digit or _, but at least 1 letter, after XX@XX needs dot, and after only letters
			@email = new_email
		else
			raise StandardError.new "Wrong email address."
		end
	end
	
	def set_telegram(new_telegram)
		if new_telegram.class == String
			dog = false
			if new_telegram[0] == '@' #check for first staying @
				dog = true
			end
			@telegram = (if dog then '' else '@' end) + new_telegram
		else
			raise ArgumentError.new "Telegram must be String value."
		end
	end
	
	def set_git(new_git)
		if new_git == "" # if we set empty string, then we clear git
			@git = ""
		elsif new_git.match(/^(https\:\/\/)?[(github)(gitlab)]\.com\/\w+$/) # at begin may be https://, after need github.com/ or gitlab.com/, after we need user id
			@git = new_git
		else
			raise StandardError.new "Wrong git user address."
		end
	end
	
	def initialize(new_name:, new_family:, new_patronymic:, new_number:"", new_email:"", new_telegram:"", new_git:"")
		#name, family and patromymic are necessary, others optional
		set_name(new_name:new_name, new_family:new_family, new_patronymic:new_patronymic)
		set_phone_number(new_number)
		set_email(new_email)
		set_telegram(new_telegram)
		set_git(new_git)
	end
	
end
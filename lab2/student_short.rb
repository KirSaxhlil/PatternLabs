class StudentShort
	def initialize(object:nil, hash:nil)
		if object != nil
			constructor_object(object)
		elsif hash != nil
			constructor_string(hash)
		else
			constructor_default()
		end
	end
	
	private
	
	def constructor_default
		raise ArgumentError.new "StudentShort's constructor needs data."
	end
	def constructor_object(object)
		self.name = object.get_family_and_initials()
		self.git = object.git
		if object.has_phone_number()
			self.contact = object.phone_number
		elsif object.has_telegram()
			self.contact = object.telegram
		elsif object.has_email()
			self.contact = object.email
		end
	end
	def constructor_string(hash)
		self.id = hash[:id]
		splitted = hash[:string].split(';')
		self.name = splitted[0]
		self.git = splitted[1]
		self.contact = splitted[2]
	end
	
	def id=(new_id)
		@id = new_id
	end
	
	def name=(new_name)
		@name = new_name
	end
	
	def git=(new_git)
		@git = new_git
	end
	
	def contact=(new_contact)
		@contact = new_contact
	end
end
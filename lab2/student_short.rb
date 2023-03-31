require_relative "base_student.rb"
require_relative "student.rb"

class StudentShort < BaseStudent
	attr_reader :short_name
	
	def initialize(object:nil, hash:nil)
		if object != nil
			constructor_object(object)
		elsif hash != nil
			constructor_string(hash)
		else
			constructor_default()
		end
	end
	
	### CONSTRUCTOR METHODS
	private
	
	def constructor_object(object)
		self.id = object.id
		self.short_name = object.get_family_and_initials()
		self.git = object.git
		contact = object.get_one_contact()
		if contact != nil
			set_contact_by_name(contact[:type], contact[:contact])
		end
	end
	def constructor_string(hash)
		self.id = hash[:id]
		splitted = hash[:string].split(';')
		if !Student.is_family_and_initials(splitted[0])
			raise ArgumentError.new "Family and initials in wrong format."
		end
		self.short_name = splitted[0]
		self.git = splitted[1]
		contact_splitted = splitted[2].split(':')
		set_contact_by_name(contact_splitted[0], contact_splitted[1])
	end
	
	### OBJECT PUBLIC METHODS
	public
	
	def get_info
		info = super()
		info += ";#{short_name};"
		info += "#{self.git};"
		contact = get_one_contact()
		info += "#{contact[:type]}:#{contact[:contact]}"
		return info
	end
	
	### OBJECT PRIVATE METHODS
	
	private :set_contacts, :git=, :id=
	
	private
	
	def short_name=(new_short_name)
		@short_name = new_short_name
	end
	
	def set_contact_by_name(name, contact)
		case name
			when "phone_number"
				set_contacts(phone_number:contact)
			when "telegram"
				set_contacts(telegram:contact)
			when "email"
				set_contacts(email:contact)
		end
	end
end
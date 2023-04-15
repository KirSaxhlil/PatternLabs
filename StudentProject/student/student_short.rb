require_relative "base_student.rb"
require_relative "student.rb"

class StudentShort < BaseStudent
	### GENERATED
	public attr_reader :short_name
	
	### INITIALIZE
	private
	
	# hash = {:id, :short_name, :git, :contact_type, :contact}
	def initialize(hash)
		if !Student.is_family_and_initials(hash[:short_name])
			raise ArgumentError.new "Family and initials in wrong format."
		end
		self.short_name = hash[:short_name]
		set_contact_by_name(hash[:contact_type], hash[:contact])
		super({id:hash[:id], git:hash[:git]})
	end
	
	### CONSTRUCTOR METHODS
	public
	
	def self.new_object(object)
		contact = object.get_one_contact()
		if contact == nil then contact = {type:nil, contact:nil} end
		return new({id:object.id, short_name:(object.get_family_and_initials()), git:object.git, contact_type:contact[:type], contact:contact[:contact]})
	end
	def self.new_string(new_id, string)
		splitted = string.split(';')
		contact_splitted = splitted[2].split(':')
		return new({id:new_id, short_name:splitted[0], git:splitted[1], contact_type:contact_splitted[0], contact:contact_splitted[1]})
	end
	
	### OBJECT PUBLIC METHODS
	public
	
	def get_info
		info = super()
		info += ";#{self.short_name};"
		info += "#{self.git};"
		contact = get_one_contact()
		if contact != nil
			info += "#{contact[:type]}:#{contact[:contact]}"
		end
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
				set_contacts(phone_number:contact, telegram:"", email:"")
			when "telegram"
				set_contacts(telegram:contact, phone_number:"", email:"")
			when "email"
				set_contacts(email:contact, phone_number:"", telegram:"")
		end
	end
end
require_relative "base_student.rb"

class Student < BaseStudent
	attr_reader :name, :family, :patronymic
	
	def initialize(hash:nil, string:nil)
		if string != nil
			constructor_string(string)
		else
			super(hash)
		end
	end
	
	### CONSTRUCTOR METHODS
	private
	
	def constructor_hash(hash)
		#name, family and patronymic are necessary, others optional
		if(hash[:name] == nil or hash[:family] == nil or hash[:patronymic] == nil)
			raise ArgumentError.new "Name, family and patronymic are necessary for constructor."
		end
		set_name({name:hash[:name], family:hash[:family], patronymic:hash[:patronymic]})
		super({id:hash[:id], git:hash[:git], phone_number:hash[:phone_number], email:hash[:email], telegram:hash[:telegram]})
	end
	
	def constructor_string(string)
		splitted = string.split(';', -1)
		if splitted.length != 8 # we need all 8 fields, even if it empty
			raise ArgumentError.new "Wrong string format for constructor."
		end
		constructor_hash({id:splitted[0], name:splitted[1], family:splitted[2], patronymic:splitted[3], phone_number:splitted[4], email:splitted[5], telegram:splitted[6], git:splitted[7]})
	end
	
	### OBJECT PUBLIC METHODS
	public
	
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
		if hash[:patronymic] != nil #if we not input patronymic, not change this
			if hash[:patronymic].match(/^[a-zA-Z]+$/)
				@patronymic = hash[:patronymic].capitalize
			else
				raise ArgumentError.new "Wrong patronymic."
			end
		end
	end
	
	def get_family_and_initials
		return "#{self.family} #{self.name[0]}.#{self.patronymic[0]}."
	end
	
	def get_info_full
		info = ""
		info += "This is info about: #{self.family} #{self.name} #{self.patronymic}" + "\n"
		info += "Phone number: #{self.phone_number}" + "\n" if self.phone_number != nil
		info += "Email: #{self.email}" + "\n" if self.email != nil
		info += "Telegram: #{self.telegram}" + "\n" if self.telegram != nil
		info += "Git: #{self.git}" + "\n" if self.git != nil
		return info
	end
	
	def get_info
		info = super()
		info += ";#{get_family_and_initials()};"
		info += "#{self.git};"
		if self.phone_number != nil then info += "phone_number:#{self.phone_number}"
		elsif self.telegram != nil then info += "telegram:#{self.telegram}"
		elsif self.email != nil then info += "email:#{self.email}"
		end
		return info
	end
	
	### CLASS METHODS
	public
	
	def self.is_family_and_initials(string)
		return string.match(/^[a-zA-Z]+ [a-zA-Z].[a-zA-Z].$/)
	end
	
	def self.read_from_txt(path)
		objects = []
		File.open(path, "r") do |file|
			file.each_line { |x| objects.push(Student.new(string:x[0..-2])) }
		end
		return objects
	end
end
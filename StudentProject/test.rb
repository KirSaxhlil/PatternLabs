class Parent
	public
	def main_func()
		puts inner_func()
	end
	
	private
	def inner_func()
		return ""
	end
end

class Child < Parent
	def inner_func()
		return "pattern"
	end
end

obj = Child.new()

obj.main_func
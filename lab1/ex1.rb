puts "Hello, World!"

puts "Hello, #{ARGV[0]}"

puts "What your favourite language?"
lang = STDIN.gets.chomp.downcase

case lang
	when "ruby"
		puts "padleza"
	else
		puts "Skora bdet rube."
		case lang
			when "c++"
				puts "Respeckckckt"
			when "java"
				puts "srinje"
			when "python"
				puts "I am antipythoner, leave."
			else
				puts "idk what is it"
		end
end
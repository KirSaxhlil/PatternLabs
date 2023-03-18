require_relative "student.rb"

object1 = Student.new(new_name:"Arbux", new_family:"Alebarod", new_patronymic:"Achekavich", new_number:"+79189356731", new_email:"address@mail.sd", new_telegram:"@ahto_ahaha", new_git:"https://github.com/CyBeR_uSeR")
object2 = Student.new(new_name:"Ti", new_family: "Prikki", new_patronymic:"Noitaich", new_email:"my_bestEmail3@cybermail.gog", new_git:"gitlab.com/stellAr")
object3 = Student.new(new_name:"lARrius", new_family:"VarrO", new_patronymic:"sToRyViCh", new_number:79336421496, new_telegram:"BloodBath")

puts object1.GetInfo()
puts object2.GetInfo()
puts object3.GetInfo()
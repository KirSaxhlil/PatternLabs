require_relative "student.rb"

object1 = Student.new({name:"Arbux", family:"Alebarod", patronymic:"Achekavich", number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
object2 = Student.new({name:"Ti", family: "Prikki", patronymic:"Noitaich", email:"my_bestEmail3@cybermail.gog", git:"gitlab.com/stellAr"})
object3 = Student.new({name:"lARrius", family:"VarrO", patronymic:"sToRyViCh", number:79336421496, telegram:"BloodBath"})

puts object1.GetInfo()
puts object2.GetInfo()
puts object3.GetInfo()
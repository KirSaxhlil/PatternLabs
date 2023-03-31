require_relative "student.rb"

object1 = Student.new(hash:{name:"Arbux", family:"Alebarod", patronymic:"Achekavich", phone_number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
#object2 = Student.new(hash:{name:"Ti", family: "Prikki", patronymic:"Noitaich", email:"my_bestEmail3@cybermail.gog", git:"gitlab.com/stellAr"})
#object3 = Student.new(hash:{name:"lARrius", family:"VarrO", patronymic:"sToRyViCh", phone_number:79336421496, telegram:"BloodBath"})
object4 = Student.new(string:"NAME;FAMILIAR;PAPAPAPA;89882883838;;gigaChad;")
object5 = Student.new()

puts object1.get_info()
#puts object2.get_info()
#puts object3.get_info()
puts object4.get_info()

#object3.set_contacts({email:"aba@sringe.com", telegram:nil})
#puts object3.get_info()

#puts object1.validate()
#puts object2.validate()
#puts object3.validate()
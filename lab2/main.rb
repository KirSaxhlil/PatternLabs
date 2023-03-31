require_relative "student.rb"
require_relative "student_short.rb"

#object1 = Student.new(hash:{id:0, name:"Arbux", family:"Alebarod", patronymic:"Achekavich", phone_number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
#object2 = Student.new(hash:{id:1, name:"Ti", family: "Prikki", patronymic:"Noitaich", email:"my_bestEmail3@cybermail.gog", git:"gitlab.com/stellAr"})
#object3 = Student.new(hash:{id:"2", name:"lARrius", family:"VarrO", patronymic:"sToRyViCh", phone_number:79336421496, telegram:"BloodBath"})
#object4 = Student.new(string:"3;NAME;FAMILIAR;PAPAPAPA;89882883838;;;")
#object5 = Student.new()

#object_short1 = StudentShort.new(hash:{id:5, string:"Bafyly B.T.;github.com/JJJ_rare;telegram:tigra"})
#puts object_short1.get_info()

#puts object1.get_info()
#puts object2.get_info()
#puts object3.get_info()
#puts object4.get_info()

students = Student.read_from_txt("students.txt")

students.each { |obj| puts obj.get_info }

#object3.set_contacts({email:"aba@sringe.com", telegram:nil})
#puts object3.get_info()

#puts object1.validate()
#puts object2.validate()
#puts object3.validate()
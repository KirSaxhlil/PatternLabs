require_relative "student.rb"
require_relative "student_short.rb"
require_relative "data_table.rb"
require_relative "data_list.rb"
require_relative "data_list_student_short.rb"
require_relative "students_list.rb"
require_relative "file_operator_txt.rb"

object1 = Student.new_hash({id:0, name:"Arbux", family:"Alebarod", patronymic:"Achekavich", phone_number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
#object2 = Student.new(hash:{id:1, name:"Ti", family: "Prikki", patronymic:"Noitaich", email:"my_bestEmail3@cybermail.gog", git:"gitlab.com/stellAr"})
#object3 = Student.new(hash:{id:"2", name:"lARrius", family:"VarrO", patronymic:"sToRyViCh", phone_number:79336421496, telegram:"BloodBath"})
#object4 = Student.new_string("3;NAME;FAMILIAR;PAPAPAPA;89882883838;;;")
#object5 = Student.new()

#object_short1 = StudentShort.new_string(5, "Bafyly B.T.;github.com/JJJ_rare;telegram:tigra")
#object_short2 = StudentShort.new_object(object1)
#puts object_short1.get_info()
#puts object_short2.get_info()

#puts object1.get_info()
#puts object2.get_info()
#puts object3.get_info()
#puts object4.get_info()

#students = Student.read_from_txt("students.txt")
#students_short = []

#students.each { |obj| students_short.push(StudentShort.new_object(obj)) }
#students_short += [2]

#dlss = DataListStudentShort.new(students_short)

#dt = dlss.get_data()

#puts dlss.get_names()
#puts dt.get_element(1, 3)

#Student.write_to_txt("file.txt", students)

#students2 = Student.read_from_txt("file.txt")

#students2.each { |obj| puts obj.get_info }


#object3.set_contacts({email:"aba@sringe.com", telegram:nil})
#puts object3.get_info()

#puts object1.validate()
#puts object2.validate()
#puts object3.validate()

#matrix = [[1, 2, 3, 4], [3, 4, 5, 6]]

#table = DataTable.new(matrix)
#puts table.columns?

#array = [1,2,3,4,5]
#list = DataList.new(array)
#list.select(1)
#list.select(3)
#puts list.get_selected()

studentslist = StudentsList.new(FileOperatorTxt.new())
#studentslist.file_operator = FileOperatorTxt.new()
studentslist.read_file("students.txt")
#puts studentslist[10].get_info()

studentslist.sort()
studentslist.replace_student(4, object1)
dlss = studentslist.get_k_n_student_short_list(0,5)
dt = dlss.get_data()
puts dt.get_element(1,1)

#studentslist.get_k_n_student_short_list(2,2, dlss)
#dt = dlss.get_data()
#puts dt.get_element(0,3)
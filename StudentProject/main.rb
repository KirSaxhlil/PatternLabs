require_relative "student/student.rb"
require_relative "student/student_short.rb"
require_relative "collections/data_table.rb"
require_relative "collections/data_list.rb"
require_relative "collections/data_list_student_short.rb"
require_relative "collections/students_list_file.rb"
require_relative "collections/students_list_db.rb"
require_relative "data operators/file_operator_txt.rb"
require_relative "data operators/file_operator_json.rb"
require_relative "data operators/file_operator_yaml.rb"
require_relative "data operators/db_operator.rb"
require_relative "collections/students_list.rb"
require_relative "collections/students_list_db_adapter_to_file.rb"
require_relative "gui/windows/window_main.rb"
require "sqlite3"
#require "yaml"

DBOperator.connect("database/students.db")
DBOperator.instance.connection.execute("BEGIN TRANSACTION; END;")
app = FXApp.new()
FXBWindowMain.new(app)
app.create()
app.run()

#dl = StudentsList.new_db()
#dlss = dl.get_k_n_student_short_list(0,5)
#
#puts dlss.get_data().columns?

#DBOperator.connect("database/students.db")
#sldb = StudentsListDB.new()
#dlss = sldb.get_k_n_student_short_list(0,5)
#dt = dlss.get_data()
#puts dt.get_element(1, 3)

#puts sldb[3].get_info()

#db = SQLite3::Database.open 'database/students.db'
#db.results_as_hash = true
#db.execute File.read("database/scripts/structure.sql")
#db.execute File.read("database/scripts/data.sql")

#result = db.query "SELECT * FROM Student"
#result.each { |row| puts row }

#object1 = Student.new_hash({id:0, name:"Arbux", family:"Alebarod", patronymic:"Achekavich", phone_number:"+79189356731", email:"address@mail.sd", telegram:"@ahto_ahaha", git:"https://github.com/CyBeR_uSeR"})
#object2 = Student.new_hash({id:1, name:"Ti", family: "Prikki", patronymic:"Noitaich", email:"my_bestEmail3@cybermail.gog", git:"gitlab.com/stellAr"})
#object3 = Student.new(hash:{id:"2", name:"lARrius", family:"VarrO", patronymic:"sToRyViCh", phone_number:79336421496, telegram:"BloodBath"})
#object4 = Student.new_string("3;NAME;FAMILIAR;PAPAPAPA;89882883838;;;")
#object5 = Student.new()

#sldb.add_student(object1)
#sldb.replace_student(17, object2)
#sldb.remove_student(17)
#puts sldb.get_count()

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

# studentslist = StudentsList.new(FileOperatorTXT.new())
# #studentslist.read_file("students.txt")
# #studentslist.file_operator = FileOperatorYAML.new()
# studentslist.file_operator = FileOperatorJSON.new()
# #studentslist.write_file("students.yml")
# #studentslist.write_file("students.json")
# #studentslist.read_file("students.yml")
# studentslist.read_file("students.json")
# studentslist.file_operator = FileOperatorTXT.new()
# studentslist.write_file("students.txt")
#puts studentslist.get_k_n_student_short_list(2,2)
#puts studentslist[4].get_info()

#studentslist.sort()
#studentslist.replace_student(4, object1)
#dlss = studentslist.get_k_n_student_short_list(0,5)
#dt = dlss.get_data()
#puts dt.get_element(1,1)

#studentslist.get_k_n_student_short_list(2,2, dlss)
#dt = dlss.get_data()
#puts dt.get_element(0,3)

#puts YAML.load(File.read("students.yml"), permitted_classes:[Student]).get_info() #.map{|hash| hash.transform_keys(&:to_sym)}
#puts YAML.load_file("students.yml", permitted_classes:[Student]).get_info() #.map{|hash| hash.transform_keys(&:to_sym)}
#File.open("students.json", "r") do |file|
#			file.each_line { |x| if(x != "") then puts (JSON.parse(x).transform_keys(&:to_sym)) end }
#		end

#list = StudentsListFile.new()
#list.file_operator = FileOperatorTXT.new()
#list.read_file("examples/students.txt")
#list.file_operator = FileOperatorJSON.new()
#list.write_file("test.json")
#list.read_file("examples/students.json")
#list.file_operator = FileOperatorYAML.new()
#list.write_file("test.yaml")
#list.read_file("test.yaml")
#list.file_operator = FileOperatorTXT.new()
#list.write_file("test.txt")

#DBOperator.connect("database/students.db")
#list = StudentsList.new(StudentsListDB.new())
#list.add_student(object1)
#list.replace_student(18, object2)
#list.remove_student(17)
#puts Student.new_hash(DBOperator.instance.get_student(1)).get_info()
#object = Student.new_string(list[2].get_info_full())
#list = StudentsList.new(StudentsListDBAdapterToFile.new(FileOperatorTXT.new(), "test.txt"))
#list.remove_student(3)
#list.add_student(object)

#object = Student.new_string(list[4].get_info_full())
#list = StudentsList.new(StudentsListDBAdapterToFile.new(FileOperatorYAML.new(), "test.yaml"))
#list.remove_student(1)
#list.replace_student(2,object)

#hash = {"id"=>1, "field"=>"str"}
#str = "#{hash.keys[0]}"
#(1..hash.keys.length-1).each { |elem|
#    str += ", #{hash.keys[elem]}"
#}
#puts str
#
#str2 = "#{hash.values[0]}"
#(1..hash.values.length-1).each { |elem|
#    str2 += ", #{hash.values[elem]}"
#}
#puts str2
#hash.delete(:id.to_s)
#puts hash.keys
#puts hash.values
#
#hash = object1.to_hash()
#hash.delete(:id.to_s)
#fields = "#{hash.keys[0]}"
#		(1..hash.keys.length-1).each { |elem|
#			fields += ", #{hash.keys[elem]}"
#		}
#		
#		values = "#{hash.values[0]}"
#		(1..hash.values.length-1).each { |elem|
#			values += ", #{hash.values[elem]}"
#		}
#puts fields.class
#puts values.class
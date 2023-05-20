#require_relative "../../collections/students_list.rb"
#require_relative "../../collections/data_list_student_short.rb"
require_relative "../windows/window_student.rb"
require_relative "../../student/student.rb"
require_relative "../../collections/students_list.rb"

class AddStudentController
    ### GENERATED
    private attr_reader :window

    ### INITIALIZE
    private

    def initialize(view)
        @window = view
    end

    ### PUBLIC OBJECT METHODS
    public

    def validate_fields()
        #correct = true && Student.is_name(self.window.family_field.text)
        correct = true
        correct = correct && Student.is_name(self.window.family_field.text)
        correct = correct && Student.is_name(self.window.name_field.text)
        correct = correct && Student.is_name(self.window.patronymic_field.text)
        correct = correct && Student.is_phone_number(self.window.phone_field.text)
        correct = correct && Student.is_telegram(self.window.telegram_field.text)
        correct = correct && Student.is_email(self.window.email_field.text)
        correct = correct && Student.is_git(self.window.git_field.text)

        if (correct)
            window.ok_btn.enable()
        else
            window.ok_btn.disable()
        end
    end

    def create_student()
        temp = Student.new_hash({name:self.window.name_field.text, family:self.window.family_field.text, patronymic:self.window.patronymic_field.text, phone_number:self.window.phone_field.text, telegram:self.window.telegram_field.text, email:self.window.email_field.text, git:self.window.git_field.text })
        window.parent.controller.list.add_student(temp)
        window.hide()
    end

    def close_window()
        window.hide()
    end
end
require_relative "../collections/students_list.rb"
class StudentsListController
    ### GENERATED
    private attr_reader :window, :list

    ### INITIALIZE
    private

    def initialize(view)
        @window = view
        @list = StudentsList.new_db()
    end
end
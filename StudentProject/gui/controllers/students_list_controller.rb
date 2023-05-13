require_relative "../../collections/students_list.rb"
require_relative "../../collections/data_list_student_short.rb"
require_relative "../windows/window_main.rb"

class StudentsListController
    ### GENERATED
    private attr_reader :window
    private attr_accessor :list_short
    public attr_reader :list

    ### INITIALIZE
    private

    def initialize(view)
        @window = view
        @list = StudentsList.new_db()
    end

    ### PUBLIC OBJECT METHODS
    public

    def refresh_data()
        if self.list_short == nil
            self.list_short = list.get_k_n_student_short_list(window.page, window.elements_by_page)
        else
            list.get_k_n_student_short_list(window.page, window.elements_by_page, self.list_short)
        end

        self.list_short.notify(window.students_list_view.table_region.table)

        self.list.notify(window.students_list_view.table_region)
    end

    def create_student_window()
        win = FXBWindowStudent.new(window.app, window)
        win.create
    end
end
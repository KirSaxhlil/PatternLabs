require "fox16"
include Fox

require_relative "../blocks/fxb_students_list_view.rb"
require_relative "../controllers/students_list_controller.rb"
require_relative "window_student.rb"

class FXBWindowMain < FXMainWindow
    ### GENERATED
    public attr_reader :students_list_view
    private attr_writer :students_list_view
    public attr_reader :controller
    public attr_reader :app

    ### INITIALIZE
    private
    def initialize(app)
        @controller = StudentsListController.new(self)

        @app = app
        super(app, "Ультра руби прилога", width:1000, height:400)
        tabber = FXTabBook.new(self, opts:LAYOUT_FILL)

        tab1_item = FXTabItem.new(tabber, "Вкладка 1")
        tab1_frame = FXHorizontalFrame.new(tabber, opts:LAYOUT_FILL)
        self.students_list_view = FXBStudentListView.new(tab1_frame)

        tab2_item = FXTabItem.new(tabber, "Вкладка 2")
        tab2_frame = FXHorizontalFrame.new(tabber)

        tab3_item = FXTabItem.new(tabber, "Вкладка 3")
        tab3_frame = FXHorizontalFrame.new(tabber)

        self.controller.refresh_data()

        self.button_clicks_reaction()
        self.filter_defaults()
    end

    ### PUBLIC OBJECT METHODS
    public

    def elements_by_page
        self.students_list_view.table_region.elements_by_page
    end

    def page
        self.students_list_view.table_region.page
    end

    ### PRIVATE OBJECT METHODS
    private

    def create()
        super
        show(PLACEMENT_SCREEN)
    end

    def button_clicks_reaction()
        self.students_list_view.table_region.btn_next_page.connect(SEL_COMMAND) { |sender|
            self.students_list_view.table_region.change_page(1)
            self.controller.refresh_data()
        }

        self.students_list_view.table_region.btn_prev_page.connect(SEL_COMMAND) { |sender|
            self.students_list_view.table_region.change_page(-1)
            self.controller.refresh_data()
        }

        self.students_list_view.buttons_region.btn_update.connect(SEL_COMMAND) { |sender|
            self.students_list_view.table_region.change_page(0)
            self.controller.refresh_data()
        }

        self.students_list_view.buttons_region.btn_create.connect(SEL_COMMAND) { |sender|
            self.btn_create_on_click()
        }
    end

    def filter_defaults()
        self.students_list_view.filter_region.fb_git.list_filter.currentItem = 2
        self.students_list_view.filter_region.fb_email.list_filter.currentItem = 2
        self.students_list_view.filter_region.fb_phone.list_filter.currentItem = 2
        self.students_list_view.filter_region.fb_telegram.list_filter.currentItem = 2

        self.students_list_view.filter_region.fb_git.change_input_editable()
        self.students_list_view.filter_region.fb_email.change_input_editable()
        self.students_list_view.filter_region.fb_phone.change_input_editable()
        self.students_list_view.filter_region.fb_telegram.change_input_editable()
    end

    def btn_create_on_click()
        self.controller.create_student_window()
    end
end
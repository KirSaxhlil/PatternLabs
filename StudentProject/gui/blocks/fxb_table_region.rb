require "fox16"
include Fox

require_relative "../elements/fx_table_students.rb"

class FXBTableRegion
    ### GENERATED
    private attr_writer :table, :tf_elems_by_page, :btn_prev_page, :l_pages, :btn_next_page, :pages_count
    public attr_reader :table, :tf_elems_by_page, :btn_prev_page, :l_pages, :btn_next_page
    public attr_accessor :page
    private attr_accessor :items_count

    ### INITIALIZE
    private

    def initialize(column)
        self.table = FXTableStudents.new(column)
        self.page = 0

        undertable_horizon = FXHorizontalFrame.new(column, opts:LAYOUT_FILL_X)

        undertable_horizon_left = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_LEFT)
        FXLabel.new(undertable_horizon_left, "Элементов на странице:")
        self.tf_elems_by_page = FXTextField.new(undertable_horizon_left, 10, opts:FRAME_SUNKEN|FRAME_THICK|LAYOUT_FIX_WIDTH, width:30)
        self.tf_elems_by_page.text = "5"

        undertable_horizon_rigth = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_RIGHT)
        self.btn_prev_page = FXButton.new(undertable_horizon_rigth, "<<")
        self.l_pages = FXLabel.new(undertable_horizon_rigth, "Страница X из N")
        self.btn_next_page = FXButton.new(undertable_horizon_rigth, ">>")
    end

    ### PUBLIC OBJECT METHODS
    public

    def refresh_pages_data(count)
        self.items_count = count
        self.l_pages.text = "Страница #{self.page+1} из #{self.pages_count}"

        if self.pages_count == 1
            self.btn_prev_page.disable()
            self.btn_next_page.disable()
        elsif self.page == 0
            self.btn_prev_page.disable()
            self.btn_next_page.enable()
        elsif self.page == self.pages_count-1
            self.btn_prev_page.enable()
            self.btn_next_page.disable()
        else
            self.btn_prev_page.enable()
            self.btn_next_page.enable()
        end
    end

    def elements_by_page
        self.tf_elems_by_page.text.to_i
    end

    def change_page(delta)
        self.page += delta
        if (self.page >= self.pages_count)
            self.page = self.pages_count-1
        end
    end

    def pages_count
        (self.items_count.to_f/self.elements_by_page).ceil()
    end
end
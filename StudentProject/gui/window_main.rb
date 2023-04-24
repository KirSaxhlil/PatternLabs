require "fox16"
include Fox

class FXBWindowMain < FXMainWindow
    ### GENERATED
    private attr_writer :students_list_view
    private attr_reader :controller, :students_list_view

    ### INITIALIZE
    private
    def initialize(app)
        @controller = StudentsListController.new(self)

        super(app, "Ультра руби прилога", width:1000, height:400)
        tabber = FXTabBook.new(self, opts:LAYOUT_FILL)

        tab1_item = FXTabItem.new(tabber, "Вкладка 1")
        tab1_frame = FXHorizontalFrame.new(tabber, opts:LAYOUT_FILL)
        self.students_list_view = FXBStudentListView.new(tab1_frame)

        tab2_item = FXTabItem.new(tabber, "Вкладка 2")
        tab2_frame = FXHorizontalFrame.new(tabber)

        tab3_item = FXTabItem.new(tabber, "Вкладка 3")
        tab3_frame = FXHorizontalFrame.new(tabber)
    end

    ### PRIVATE OBJECT METHODS
    private

    def create()
        super
        show(PLACEMENT_SCREEN)
    end
end

class FXBStudentListView
    ### GENERATED
    private attr_writer :filter_region, :table_region, :buttons_region
    public attr_reader :filter_region, :table_region, :buttons_region

    ### INITIALIZE
    private
    
    def initialize(frame)
        column_filter = FXVerticalFrame.new(frame, opts:LAYOUT_FIX_WIDTH, width:200)

        self.filter_region = FXBFilterRegion.new(column_filter)

        column_table = FXVerticalFrame.new(frame, opts:LAYOUT_FILL)
        self.table_region = FXBTableRegion.new(column_table)

        column_buttons = FXVerticalFrame.new(frame, opts:LAYOUT_FIX_WIDTH, width:150)
        self.buttons_region = FXBButtonsRegion.new(column_buttons)
        self.buttons_region.table_selection_reaction(self.table_region.table)
    end
end

class FXBFilterRegion
    ### GENERATED
    private attr_writer :fb_git, :fb_email, :fb_phone, :fb_telegram, :tf_name
    public attr_reader :fb_git, :fb_email, :fb_phone, :fb_telegram, :tf_name

    ### INITIALIZE
    private
    
    def initialize(column)
        hor_name = FXHorizontalFrame.new(column, opts:LAYOUT_FILL_X)
        FXLabel.new(hor_name, "ФИО:")
        self.tf_name = FXTextField.new(hor_name, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        self.fb_git = FXBFilterBlock.new(column, "Есть git?")
        self.fb_email = FXBFilterBlock.new(column, "Есть почта?")
        self.fb_phone = FXBFilterBlock.new(column, "Есть телефон?")
        self.fb_telegram = FXBFilterBlock.new(column, "Есть телеграм?")
    end
end

class FXBTableRegion
    ### GENERATED
    private attr_writer :table, :tf_elems_by_page, :btn_prev_page, :l_pages, :btn_next_page
    public attr_reader :table, :tf_elems_by_page, :btn_prev_page, :l_pages, :btn_next_page

    ### INITIALIZE
    private

    def initialize(column)
        self.table = FXTableStudents.new(column)
        fill_test_data()

        undertable_horizon = FXHorizontalFrame.new(column, opts:LAYOUT_FILL_X)

        undertable_horizon_left = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_LEFT)
        FXLabel.new(undertable_horizon_left, "Элементов на странице:")
        self.tf_elems_by_page = FXTextField.new(undertable_horizon_left, 10, opts:FRAME_SUNKEN|FRAME_THICK|LAYOUT_FIX_WIDTH, width:30)

        undertable_horizon_rigth = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_RIGHT)
        self.btn_prev_page = FXButton.new(undertable_horizon_rigth, "<<")
        self.l_pages = FXLabel.new(undertable_horizon_rigth, "Страница X из N")
        self.btn_next_page = FXButton.new(undertable_horizon_rigth, ">>")
    end

    ### PRIVATE OBJECT METHODS
    private

    def fill_test_data()
        self.table.appendRows(4)
        self.table.setItemText(0, 0, "213")
        self.table.setItemText(1, 0, "343")
        self.table.setItemText(2, 0, "124")
        self.table.setItemText(3, 0, "5")
    end
end

class FXBButtonsRegion
    ### GENERATED
    private attr_writer :btn_create, :btn_change, :btn_delete, :btn_update
    public attr_reader :btn_create, :btn_change, :btn_delete, :btn_update

    ### INITIALIZE
    private

    def initialize(column)
        self.btn_create = FXButton.new(column, "Добавить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_change = FXButton.new(column, "Изменить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_delete = FXButton.new(column, "Удалить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_update = FXButton.new(column, "Обновить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_change.disable()
        self.btn_delete.disable()
    end

    ### PUBLIC OBJECT METHODS
    public

    def table_selection_reaction(table)
        table.connect(SEL_COMMAND) { |sender, sel, data|
            dist = table.selEndRow - table.selStartRow
            if table.selStartRow == -1
                self.btn_change.disable()
                self.btn_delete.disable()
            elsif dist > 0
                self.btn_change.disable()
                self.btn_delete.enable()
            elsif dist == 0
                self.btn_change.enable()
                self.btn_delete.enable()
            end
        }
    end
end

class FXListFilter < FXListBox
    ### INITIALIZE
    private

    def initialize(parent)
        super(parent, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.numVisible = 3
        self.appendItem("Жа")
        self.appendItem("Не")
        self.appendItem("Невжн")
    end
end

class FXBFilterBlock
    ### GENERATED
    private attr_writer :list_filter, :input_field
    public attr_reader :list_filter, :input_field
    ### INITIALIZE
    private

    def initialize(parent, label)
        horizontal_frame = FXHorizontalFrame.new(parent, opts:LAYOUT_FILL_X)
        FXLabel.new(horizontal_frame, label)
        self.list_filter = FXListFilter.new(horizontal_frame)
        self.input_field = FXTextField.new(parent, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.list_filter.connect(SEL_COMMAND) { |sender, sel, data|
            self.input_field.editable = (data == 0)
        }
    end
end

class FXTableStudents < FXTable
    ### INITIALIZE
    private

    def initialize(parent)
        super(parent, width:300, opts:TABLE_READONLY|TABLE_COL_SIZABLE|TABLE_ROW_RENUMBER|LAYOUT_FILL|FRAME_SUNKEN|FRAME_THICK)
        self.appendColumns(4)

        self.setColumnText(0, "ID")
        self.setColumnText(1, "ФИО")
        self.setColumnText(2, "Гит")
        self.setColumnText(3, "Контакт")

        self.setColumnWidth(0, 50)
        self.setColumnWidth(1, 150)
        self.setColumnWidth(2, 200)
        self.setColumnWidth(3, 100)

        self.setRowHeaderWidth(30)

        self.getColumnHeader.connect(SEL_COMMAND) do |a, b, column|
            sort_by_column(column)
          end
    end

    ### PRIVATE OBJECT METHODS
    private

    def sort_by_column(column)
        #ере
        table_data = (0...self.getNumRows()).map { |row_index| (0...self.getNumColumns()).map { |col_index| self.getItemText(row_index, col_index) } }
    
        sorted_table_data = table_data.sort_by { |row_data|
            if row_data[column] =~ /^\d+$/
                [2, $&.to_i]
            else
                [1, row_data[column]]
            end
        }
    
        sorted_table_data.each_with_index do |row_data, row_index|
          row_data.each_with_index do |cell_data, col_index|
            self.setItemText(row_index, col_index, cell_data)
          end
        end
      end
end
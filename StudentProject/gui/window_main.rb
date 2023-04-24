require "fox16"
include Fox

class WindowMain < FXMainWindow
    def initialize(app)
        super(app, "Ультра руби прилога", width:1000, height:400)
        tabber = FXTabBook.new(self, opts:LAYOUT_FILL)

        tab1_item = FXTabItem.new(tabber, "Вкладка 1")
        tab1_frame = FXHorizontalFrame.new(tabber, opts:LAYOUT_FILL)
        tab1_design(tab1_frame)

        tab2_item = FXTabItem.new(tabber, "Вкладка 2")
        tab2_frame = FXHorizontalFrame.new(tabber)

        tab3_item = FXTabItem.new(tabber, "Вкладка 3")
        tab3_frame = FXHorizontalFrame.new(tabber)
    end
    def create()
        super
        show(PLACEMENT_SCREEN)
    end
    def tab1_design(frame)
        column_filter = FXVerticalFrame.new(frame, opts:LAYOUT_FIX_WIDTH, width:200)

        hor_name = FXHorizontalFrame.new(column_filter, opts:LAYOUT_FILL_X)
        FXLabel.new(hor_name, "ФИО:")
        field_name = FXTextField.new(hor_name, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        bf_git = FXBlockFilter.new(column_filter, "Есть git?")
        bf_email = FXBlockFilter.new(column_filter, "Есть почта?")
        bf_phone = FXBlockFilter.new(column_filter, "Есть телефон?")
        bf_telegram = FXBlockFilter.new(column_filter, "Есть телеграм?")

        column_table = FXVerticalFrame.new(frame, opts:LAYOUT_FILL)
        table = FXTableStudents.new(column_table)
        table.appendRows(4) #test
        table.setItemText(0, 0, "213") #test
        table.setItemText(1, 0, "343") #test
        table.setItemText(2, 0, "124") #test
        table.setItemText(3, 0, "5") #test
        undertable_horizon = FXHorizontalFrame.new(column_table, opts:LAYOUT_FILL_X)
        undertable_horizon_left = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_LEFT)
        FXLabel.new(undertable_horizon_left, "Элементов на странице:")
        count_input = FXTextField.new(undertable_horizon_left, 10, opts:FRAME_SUNKEN|FRAME_THICK|LAYOUT_FIX_WIDTH, width:30)
        undertable_horizon_rigth = FXHorizontalFrame.new(undertable_horizon, opts:LAYOUT_RIGHT)
        btn_prev_page = FXButton.new(undertable_horizon_rigth, "<<")
        FXLabel.new(undertable_horizon_rigth, "Страница X из N")
        btn_next_page = FXButton.new(undertable_horizon_rigth, ">>")

        
        
    end
end

class FXListFilter < FXListBox
    def initialize(parent)
        super(parent, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.numVisible = 3
        self.appendItem("Жа")
        self.appendItem("Не")
        self.appendItem("Невжн")
    end
end

class FXBlockFilter
    def initialize(parent, label)
        horizontal_frame = FXHorizontalFrame.new(parent, opts:LAYOUT_FILL_X)
        FXLabel.new(horizontal_frame, label)
        list_filter = FXListFilter.new(horizontal_frame)
        input_field = FXTextField.new(parent, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        list_filter.connect(SEL_COMMAND) { |sender, sel, data|
            input_field.editable = (data == 0)
        }
    end
end

class FXTableStudents < FXTable
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
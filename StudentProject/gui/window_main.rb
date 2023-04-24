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


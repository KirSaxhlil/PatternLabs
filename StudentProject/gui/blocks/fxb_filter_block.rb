require "fox16"
include Fox

require_relative "../elements/fx_list_filter.rb"

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
            change_input_editable()
        }
    end

    ### PUBLIC OBJECT METHODS
    public

    def change_input_editable()
        self.input_field.editable = (self.list_filter.currentItem == 0)
    end
end
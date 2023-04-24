require "fox16"
include Fox

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
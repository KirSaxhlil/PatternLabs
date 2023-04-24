require "fox16"
include Fox

require_relative "fxb_filter_region.rb"
require_relative "fxb_table_region.rb"
require_relative "fxb_buttons_region.rb"

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
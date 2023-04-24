require "fox16"
include Fox

require_relative "fxb_filter_block.rb"

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
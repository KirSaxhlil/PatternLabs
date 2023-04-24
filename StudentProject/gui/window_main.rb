require "fox16"
include Fox

class WindowMain < FXMainWindow
    def initialize(app)
        super(app, "Ультра руби прилога", width:400, height:400)
        tabber = FXTabBar.new(self)
        tab1 = FXTabItem.new(tabber, "Вкладка 1")
        tab2 = FXTabItem.new(tabber, "Вкладка 2")
        tab3 = FXTabItem.new(tabber, "Вкладка 3")
    end
    def create()
        super
        show(PLACEMENT_SCREEN)
    end
end
require "fox16"
include Fox

require_relative "../controllers/add_student_controller.rb"

class FXBWindowStudent < FXMainWindow
    ### GENERATED
    public attr_reader :parent
    private attr_reader :controller
    public attr_reader :family_field, :name_field, :patronymic_field, :phone_field, :telegram_field, :email_field, :git_field
    public attr_reader :ok_btn, :cancel_btn

    ### INITIALIZE
    private
    def initialize(app, parent)
        @parent = parent
        @controller = AddStudentController.new(self)

        super(app, "Добавить...", width:400, height:300)
        vertical_frame = FXVerticalFrame.new(self, opts:LAYOUT_FILL_X)
        
        family_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(family_hor, "Фамилия:")
        @family_field = FXTextField.new(family_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        name_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(name_hor, "Имя:")
        @name_field = FXTextField.new(name_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        patronymic_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(patronymic_hor, "Отчество:")
        @patronymic_field = FXTextField.new(patronymic_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        phone_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(phone_hor, "Телефон:")
        @phone_field = FXTextField.new(phone_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        telegram_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(telegram_hor, "Телеграм:")
        @telegram_field = FXTextField.new(telegram_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        email_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(email_hor, "Email:")
        @email_field = FXTextField.new(email_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        git_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        FXLabel.new(git_hor, "Git:")
        @git_field = FXTextField.new(git_hor, 10, opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        buttons_hor = FXHorizontalFrame.new(vertical_frame,  opts:LAYOUT_FILL_X)
        @ok_btn = FXButton.new(buttons_hor, "Добавить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        @cancel_btn = FXButton.new(buttons_hor, "Отмена", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        self.controller.validate_fields()
        self.events()
    end

    ### PUBLIC OBJECT METHODS
    public

    def create()
        super
        show(PLACEMENT_SCREEN)
    end

    ### PRIVATE OBJECT METHODS
    private

    def events()
        self.family_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.name_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.patronymic_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.phone_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.telegram_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.email_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }
        self.git_field.connect(SEL_CHANGED) { |sender, sel, data|
            self.field_on_change()
        }

        self.ok_btn.connect(SEL_COMMAND) { |sender|
            self.ok_btn_on_click()
        }
        self.cancel_btn.connect(SEL_COMMAND) { |sender|
            self.cancel_btn_on_click()
        }
    end

    def field_on_change()
        self.controller.validate_fields()
    end

    def ok_btn_on_click()
        self.controller.create_student()
    end

    def cancel_btn_on_click()
        self.controller.close_window()
    end
end
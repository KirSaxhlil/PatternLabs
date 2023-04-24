require "fox16"
include Fox

class FXTableStudents < FXTable
	### INITIALIZE
    private

    def initialize(parent)
        super(parent, opts:TABLE_READONLY|TABLE_COL_SIZABLE|LAYOUT_FILL|FRAME_SUNKEN|FRAME_THICK) # TABLE_ROW_RENUMBER ?

        self.setRowHeaderWidth(30)

        self.getColumnHeader.connect(SEL_COMMAND) do |a, b, column|
            sort_by_column(column)
        end
    end

    ### PUBLIC OBJECT METHODS
    public

    def set_table_params(column_names, whole_entities_count)
		self.removeRows(0, self.numRows)
		self.removeColumns(0, self.numColumns)

		self.appendColumns(column_names.length)
		column_names.each_with_index { |name, index|
			self.setColumnText(index, name)
		}

		self.appendRows(whole_entities_count)
    end

	def set_table_data(data_table)
		(0..data_table.rows?-1).each { |x|
			(0..data_table.columns?-1).each { |y|
				self.setItemText(x, y, data_table.get_element(x, y).to_s)
			}
		}

		(0..self.numColumns-1).each { |index|
			step = 8

			item_length = 0

			(0..self.numRows-1).each { |jndex|
				temp = self.getItemText(jndex, index).length * step
				if (temp > item_length)
					item_length = temp
				end
			}				
			header_length = self.getColumnText(index).length * step
			if item_length > header_length
				self.setColumnWidth(index, item_length)
			elsif header_length > step*5
				self.setColumnWidth(index, header_length)
			else
				self.setColumnWidth(index, step*5)
			end
		}
	end

    ### PRIVATE OBJECT METHODS
    private

    def sort_by_column(column)
        table_data = (0...self.getNumRows()).map { |row_index|
            (0...self.getNumColumns()).map {
                |col_index| self.getItemText(row_index, col_index)
            }
        }
    
        sorted_table_data = table_data.sort_by { |row_data|
            if row_data[column] =~ /^\d+$/
                [2, $&.to_i]
            else
                [1, row_data[column]]
            end
        }
    
        sorted_table_data.each_with_index { |row_data, row_index|
            row_data.each_with_index { |cell_data, col_index|
                self.setItemText(row_index, col_index, cell_data)
            }
        }
    end
end
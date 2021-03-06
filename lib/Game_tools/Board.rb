module Board
	class Board
		MIN_POSITIVE_NUM = 1
		attr_reader :board

		def initialize(board_size)
			@board = Array.new(board_size) { Array.new(board_size, nil) }
			@board_size = board_size
		end

		def add_value(cell_number, label_player)
			x_coordinate = 0
			y_coordinate = 0
			return false if cell_number < MIN_POSITIVE_NUM or cell_number > @board_size**2
			x_coordinate = find_x_coordinate(cell_number)
			y_coordinate = find_y_coordinate(cell_number)

			if(empty_cell?(y_coordinate, x_coordinate))
				@board[y_coordinate][x_coordinate] = label_player
				return true
			end
			false	
		end

		private

		def find_x_coordinate(cell_number)
			x_coordinate = 0
			mod  =  cell_number % @board_size
			if mod == 0
				x_coordinate = @board_size - 1
			else
				x_coordinate = mod -1
			end
			x_coordinate
		end

		def find_y_coordinate(cell_number)
			y_coordinate = 0
			div  =  cell_number / @board_size
			if cell_number % @board_size == 0 
				y_coordinate = div - 1
			else
				y_coordinate = div
			end
			y_coordinate
		end

		def empty_cell?(row, column)
			return true if @board[row][column] == nil
			false
		end

	end
end
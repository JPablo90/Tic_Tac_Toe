require "Tic_Tac_Toe/version"
require "Game_tools/Player"
require "Game_tools/CheckRules"
require "pry"

module TicTacToe

	class TicTacToe
		MIN_BOARD_SIZE = 3
		MIN_POSITIVE_NUM = 1

		def initialize()
			@board = nil
			@board_size = 0
			@player1 = Player::Player.new('X')
			@player2 = Player::Player.new('O')
			@who_start = 0
		end

		def start_game()
			checkrules = CheckRules::CheckRules.new
			playing = true
			while playing
				ask_board_size()
				create_board()
				display_board()
				until @player1.winner == true or @player2.winner == true or checkrules.tie?(@board)
					change_turns_players()
					put_tap()
					@player1.winner = checkrules.winner?(@board, @player1.label, @board_size)
					@player2.winner = checkrules.winner?(@board, @player2.label, @board_size)
					reload()
				end
				winner_is()
				playing = play_again()
				@who_start += 1
			end
			nil
		end

		private
		def winner_is()
			if @player1.winner == true
				puts "The winner is the Player 1."
				@player1.winner = false
			elsif @player2.winner == true
				puts "The winner is the Player 2."
				@player2.winner = false
			else
				puts "Tie"
			end
		end

		def play_again()
			play = nil
			puts "Would you like to play again?, yes press y, no press any key: "
			play = gets.chomp
			play.downcase!
			return true if play == 'y'
			false
		end

		def put_tap()
			position = 0
			puts "Choose a position in the board for your next movement: "
			position = gets.chomp.to_i
			
			if @player1.turn ==true
				until add_value(position, @player1.label) 
					puts "The cell is not available or does not exist, choose a valid cell: "
					position = gets.chop.to_i
				end
			else
				until add_value(position, @player2.label)
					puts "The cell is not available or does not exist, choose a valid cell: "
					position = gets.chop.to_i
				end
			end
			nil
		end

		def ask_board_size()
			boardSize = 0
			puts "Type the size of your board, the board is square and the munimum size should be greater than or equal to 3: "
			boardSize = gets.chomp.to_i
			while boardSize < MIN_BOARD_SIZE
				puts "choose an appropriate value for the size of the board:"
				boardSize = gets.chomp.to_i
			end
			@board_size = boardSize
			nil
		end

		def create_board()
			@board = Array.new(@board_size) { Array.new(@board_size, nil) }
			nil
		end

		def change_turns_players()
			if @player1.turn == false and @player2.turn == false
				if @who_start%2 == 0
					@player1.turn  = true
				else
					@player2.turn = true
				end
			elsif @player1.turn == true
				@player1.turn = false
				@player2.turn = true
			else
				@player1.turn = true
				@player2.turn = false
			end 
			nil
		end

		def display_board()
			puts @board.map {|item| item.join("\t")}
			puts "____________________________________"
			nil
		end

		def reload()
 			 system("clear")
 			 display_board()
 			 nil
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



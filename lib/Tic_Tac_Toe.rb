require "Tic_Tac_Toe/version"
require "Game_tools/Player"
require "Game_tools/CheckRules"
require "Game_tools/Board"
require "pry"

module TicTacToe
	class TicTacToe
		MIN_BOARD_SIZE = 3
		MAX_BOARD_SIZE = 15

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
				@board = Board::Board.new(@board_size)
				display_board()
				until @player1.winner == true or @player2.winner == true or checkrules.tie?(@board.board)
					change_turns_players()
					put_tap()
					@player1.winner = checkrules.winner?(@board.board, @player1.label, @board_size)
					@player2.winner = checkrules.winner?(@board.board, @player2.label, @board_size)
					reload()
				end
				winner_is()
				playing = play_again()
				@who_start += 1
			end
		end

		private

		def winner_is()
			if @player1.winner
				puts "The winner is the Player 1."
				@player1.winner = false
			elsif @player2.winner
				puts "The winner is the Player 2."
				@player2.winner = false
			else
				puts "Draw."
			end
			puts "____________________________________"
			nil
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
			if @player1.turn 
				puts "Player 1 turn, choose a empty cell in the board : "
				position = gets.chomp.to_i
				until @board.add_value(position, @player1.label) 
					puts "The cell is not available or does not exist, choose a valid cell: "
					position = gets.chop.to_i
				end
			else
				puts "Player 2 turn, choose a empty cell in the board : "
				position = gets.chomp.to_i
				until @board.add_value(position, @player2.label)
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

		def change_turns_players()
			if @player1.turn
				@player1.turn = false
				@player2.turn = true
			elsif @player2.turn
				@player1.turn = true
				@player2.turn = false
			else
				if @who_start%2 == 0
					@player1.turn  = true
				else
					@player2.turn = true
				end
			end 
			nil
		end

		def display_board()
			puts @board.board.map {|item| item.join("\t")}
			puts "____________________________________"
			nil
		end

		def reload()
 			 system("clear")
 			 display_board()
 			 nil
 		end
	end
end



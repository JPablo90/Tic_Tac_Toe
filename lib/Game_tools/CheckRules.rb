module CheckRules
	class CheckRules
		attr_reader :winner
		def initialize()
			@winner = nil
		end

		def check_line(line, player_label)
			 return true if line.all? {|item| item == player_label}
			 false
		end

		def winning_row?(board, player_label)
			board.each {|row| return true if  check_line(row, player_label) == true}	
			false
		end

		def winning_column?(board, player_label)
			columns = board.transpose
			columns.each {|column| return true if  check_line(column, player_label) == true}	
			false
		end

		def winning_diagonal?(board, player_label, size_board)
			return true if check_line(getLeftDiag(board, size_board), player_label)
			return true if check_line(getRightDiag(board, size_board), player_label)
			false
		end

		def getLeftDiag(board, size_board)
			leftDiag = Array.new(size_board) { |item| item = nil }
			nCol = 0
			nRow = 0
			leftDiag.length.times{
				leftDiag[nRow] = board[nRow][nCol]
				nCol += 1
				nRow += 1
			}
			leftDiag
		end

		def getRightDiag(board, size_board)
			rightDiag = Array.new(size_board) { |item| item = nil }
			nCol = size_board - 1
			nRow = 0
			rightDiag.length.times{
				rightDiag[nRow] = board[nRow][nCol]
				nCol -= 1
				nRow += 1
			}
			rightDiag
		end

		def winner?(board, player_label, size_board)
			return true if winning_row?(board, player_label)
			return true if winning_column?(board, player_label)
			return true if winning_diagonal?(board, player_label, size_board)
			false
		end

		def tie?(board)
			board.each { |row| return false if row.any? { |item| item == nil }}
			true
		end

	end
end


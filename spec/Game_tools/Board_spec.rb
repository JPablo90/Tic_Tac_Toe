RSpec.describe Board::Board do
	board = Board::Board.new
	it "#add_value" do
		expect(true).to eq(board.add_value([['X', 'O', 'X'], ['O', 'X', nil], [nil, 'O', 'O']], 3, 6, 'X')
	end
end
RSPEC.describe Board::Board do
	board = Board::Board.new(3)

	it "#add_value" do
		expec(true).to eq(board.add_value(0,0))
	end
end
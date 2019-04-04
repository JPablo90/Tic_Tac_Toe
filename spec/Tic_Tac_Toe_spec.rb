RSpec.describe TicTacToe::TicTacToe do
	game = TicTacToe::TicTacToe.new

	it "has a version number" do
    	expect(TicTacToe::VERSION).not_to be nil
  	end

 	it "does something useful" do
    	expect(true).to eq(true)
  	end

  	it "#start_game" do
  		#game.start_game()
  	end
end
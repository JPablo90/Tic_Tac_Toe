module Player
	class Player
		attr_accessor :winner
		attr_accessor :label
		attr_accessor :turn

		def initialize()
			@winner = false
			@label = nil
			@turn = false
		end
	end
end
RSpec.describe CheckRules::CheckRules do
	checkrules = CheckRules::CheckRules.new

	it "#winner?" do
		aggregate_failures "Is there a winner?"  do
			expect(true).to eq(checkrules.winner?([['O', 'X', 'X'], ['O', 'O', 'X'], ['O', 'X', 'O']], 'O', 3))
			expect(false).to eq(checkrules.winner?([['X', 'O', 'X'], ['O', 'X', nil], [nil, 'O', 'O']], 'X', 3))
		end
	end

	it "#tie?" do
		aggregate_failures "Is there a tie?"  do
			expect(true).to eq(checkrules.tie?([['X', 'O', 'X'], ['O', 'X', 'X'], ['O', 'X', 'O']]))
			expect(false).to eq(checkrules.tie?([['X', 'O', 'X'], ['O', 'X', nil], [nil, 'O', 'O']]))
		end
	end
end
RSpec.describe CheckRules::CheckRules do
	checkrules = CheckRules::CheckRules.new

	it "#check_line" do
		expect(true).to eq(checkrules.check_line(['X', 'X','X'], 'X'))
	end

	it "#getLeftDiag" do
		expect(["X", "X", "O"]).to eq(checkrules.getLeftDiag([['X', 'O', 'X'], ['O', 'X', 'X'], ['X', 'O', 'O']], 3))
	end

	it "#getRightDiag" do
		expect(["X", "X", "X"]).to eq(checkrules.getRightDiag([['X', 'O', 'X'], ['O', 'X', 'X'], ['X', 'O', 'O']], 3))
	end

	it "#winning_row?" do
		aggregate_failures "Is there a winner row?"  do
			expect(true).to eq(checkrules.winning_row?([['X', 'O', 'X'], ['O', 'X', 'X'], ['O', 'O', 'O']], 'O'))
			expect(false).to eq(checkrules.winning_row?([['X', 'O', 'X'], ['O', 'X', 'X'], ['X', 'O', 'O']], 'O'))
		end
	end

	it "#winning_column?" do
		aggregate_failures "Is there a winn?"  do
			expect(true).to eq(checkrules.winning_column?([['O', 'X', 'X'], ['O', 'O', 'X'], ['O', 'X', 'O']], 'O'))
			expect(false).to eq(checkrules.winning_column?([['X', 'O', 'X'], ['O', 'X', 'X'], ['X', 'O', 'O']], 'O'))
		end
	end

	it "#winning_diagonal?" do
		aggregate_failures "Is there a winner?"  do
			expect(true).to eq(checkrules.winning_diagonal?([['O', 'X', 'X'], ['O', 'O', 'X'], ['O', 'X', 'O']], 'O', 3))
			expect(false).to eq(checkrules.winning_diagonal?([['X', 'O', 'X'], ['O', 'X', 'X'], ['X', 'O', 'O']], 'O', 3))
		end
	end

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
require_relative "../models/player_data_normalizer.rb" 

describe PlayerDataNormalizer do 

	before do
		@p = PlayerDataNormalizer.new
	end

	context "#determine_delimiter" do
		it "should set delimiter to '|' when data contains it" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			@p.determine_delimiter(data)
			expect(@p.delimiter).to eq("|")
		end
		
		it "should set delimiter to ',' when data contains it" do
			data = "Abercrombie, Neil, Male, Tan, 2/13/1943\nBishop, Timothy, Male, Yellow, 4/23/1967\nKelly, Sue, Female, Pink, 7/12/1959"
			@p.determine_delimiter(data)
			expect(@p.delimiter).to eq(",")
		end
		
		it "should set delimiter to ' ' when data contains it" do
			data = "Kournikova Anna F F 6-3-1975 Red\nHingis Martina M F 4-2-1979 Green\nSeles Monica H F 12-2-1973 Black"
			@p.determine_delimiter(data)
			expect(@p.delimiter).to eq(" ")
		end
	end

	context "#strip_data" do
		it "should return an array" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			@p.determine_delimiter(data)
			expect(@p.strip_data(data).class).to eq(Array)
		end

		it "should remove the delimiter" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			@p.determine_delimiter(data)
			expect(@p.strip_data(data).include?("|")).to eq(false)
		end

		it "should not remove the delimiter for a space delimiter" do
			data = "Kournikova Anna F F 6-3-1975 Red\nHingis Martina M F 4-2-1979 Green\nSeles Monica H F 12-2-1973 Black"
			@p.determine_delimiter(data)
			expect(@p.strip_data(data)).to eq(["Kournikova Anna F F 6-3-1975 Red", "Hingis Martina M F 4-2-1979 Green", "Seles Monica H F 12-2-1973 Black"])
		end
	end

	context "#order_data" do
		it "returns an array" do
			data = "Abercrombie, Neil, Male, Tan, 2/13/1943\nBishop, Timothy, Male, Yellow, 4/23/1967\nKelly, Sue, Female, Pink, 7/12/1959"
			@p.determine_delimiter(data)
			player_data = @p.strip_data(data).first
			expect(@p.order_data(player_data, @p.delimiter).class).to eq(Array)
		end
		
		it "should return player data" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			@p.determine_delimiter(data)
			player_data = @p.strip_data(data).first
			expect(@p.order_data(player_data, @p.delimiter)).to eq(["Smith", "Steve", "M", "3-3-1985", "Red"])
		end
	end

	context "#build_player_data" do
		it "should return an array" do
			data = "Kournikova Anna F F 6-3-1975 Red\nHingis Martina M F 4-2-1979 Green\nSeles Monica H F 12-2-1973 Black"
			@p.determine_delimiter(data)
			expect(@p.build_player_data(@p.strip_data(data), @p.delimiter).class).to eq(Array)
		end

		it "should return ordered players attributes array" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			@p.determine_delimiter(data)
			expect(@p.build_player_data(@p.strip_data(data), @p.delimiter).first.class).to eq(Array)
			expect(@p.build_player_data(@p.strip_data(data), @p.delimiter).first).to eq(["Smith", "Steve", "M", "3-3-1985", "Red"])
		end
	end

	context "#normalize_data" do
		it "should return an array" do
			data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			expect(@p.normalize_data(data).class).to eq(Array)
		end
	end
end 
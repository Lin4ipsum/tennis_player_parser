require_relative "../models/importer.rb" 

describe Importer do
	before do
		@i = Importer.new
		@pipe = "../data/pipe_delimited.txt"
		@comma = "../data/comma_delimited.txt"
		@space = "../data/space_delimited.txt"
	end

	context "#import_file" do
		it "should return a String" do
			expect(@i.import_file(@pipe).class).to eq(String)
		end

		it 'should import data / should not be empty' do
			expect(@i.import_file(@pipe).empty?).to eq(false)
		end

		it "should set the Imorter's data attribute to the read file" do
			expect(@i.import_file(@pipe)).to eq(
				"Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
			)
		end
	end
end

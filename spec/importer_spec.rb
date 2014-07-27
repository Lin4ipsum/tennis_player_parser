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
	# context "determine_delimiter" do

	# 	it "should return a string" do
	# 		expect(Importer.determine_delimiter(@pipe).class).to eq(String)
	# 	end

	# 	it "should return pipe when data contains a pipe" do	
	# 		expect(Importer.determine_delimiter(@pipe)).to eq("|")
	# 	end

	# 	it "should return comma when data contains a comma" do	
	# 		expect(Importer.determine_delimiter(@comma)).to eq(",")
	# 	end

	# 	it "should return space when data contains a space" do	
	# 		expect(Importer.determine_delimiter(@space)).to eq(" ")
	# 	end
	# end

	# context "should import a file" do
	# 	it "should return an array" do
	# 		expect(Importer.import_file(@comma).class).to eq(Array)
	# 	end

	# 	it "should import a comma delimited file" do
	# 		expect(Importer.import_file(@comma).first).to eq(["Abercrombie", " Neil", " Male", " Tan", " 2/13/1943"])
	# 	end

	# 	it "should import a space delimited file" do
	# 		expect(Importer.import_file(@space).first).to eq(["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"])
	# 	end

	# 	it "should import a pipe delimited file" do
	# 		expect(Importer.import_file(@pipe).first).to eq(["Smith ", " Steve ", " D ", " M ", " Red ", " 3-3-1985"])
	# 	end
	# end
#end

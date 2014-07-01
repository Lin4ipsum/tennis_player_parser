require_relative "../models/importer.rb" 

describe Importer do
	context "determine_delimiter" do

		it "should return a string" do
			Importer.determine_delimiter("../src/pipe_delimited.txt").class.should == String
		end

		it "should return pipe when data contains a pipe" do	
			Importer.determine_delimiter("../src/pipe_delimited.txt").should == "|"
		end

		it "should return comma when data contains a comma" do	
			Importer.determine_delimiter("../src/comma_delimited.txt").should == ","
		end

		it "should return space when data contains a space" do	
			Importer.determine_delimiter("../src/space_delimited.txt").should == " "
		end
	end

	context "should import a file" do
		it "should return an array" do
			Importer.import_file("../src/comma_delimited.txt").class.should == Array
		end

		it "should import a comma delimited file" do
			Importer.import_file("../src/comma_delimited.txt").first.should == ["Abercrombie", " Neil", " Male", " Tan", " 2/13/1943"]
		end

		it "should import a space delimited file" do
			Importer.import_file("../src/space_delimited.txt").first.should == ["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"]
		end

		it "should import a pipe delimited file" do
			Importer.import_file("../src/pipe_delimited.txt").first.should == ["Smith ", " Steve ", " D ", " M ", " Red ", " 3-3-1985"]
		end
	end
end

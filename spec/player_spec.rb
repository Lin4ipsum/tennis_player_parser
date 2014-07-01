require_relative "../models/player.rb" 

describe Player do
	context "attributes" do
		before do
			@player = Player.new("Simpson", "Homer", "Male", "5/13/77", "Brown")
		end

		it "can get lastname" do
			@player.last_name.should == "Simpson"
		end
		
		it "can get first name" do
			@player.first_name.should == "Homer"
		end

		it "can get gender" do
			@player.gender.should == "Male"
		end

		it "can get dob" do
			@player.date_of_birth.should == "5/13/77"
		end

		it "can get favorite color" do
			@player.favorite_color.should == "Brown"
		end
	end
end

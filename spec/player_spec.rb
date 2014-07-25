require_relative "../models/player.rb" 

describe Player do
	context "attributes" do
		before do
			@player = Player.new("Simpson", "Homer", "Male", "5/13/77", "Brown")
		end

		it "can get lastname" do
			expect(@player.last_name).to eq("Simpson")
		end
		
		it "can get first name" do
			expect(@player.first_name).to eq("Homer")
		end

		it "can get gender" do
			expect(@player.gender).to eq("Male")
		end

		it "can get dob" do
			expect(@player.date_of_birth).to eq("5/13/77")
		end

		it "can get favorite color" do
			expect(@player.favorite_color).to eq("Brown")
		end
	end
end

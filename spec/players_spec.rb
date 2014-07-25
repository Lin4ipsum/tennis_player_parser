require_relative "../models/players.rb" 
require_relative "../models/player_builder.rb" 

describe Players do
  before do
    @players = PlayerBuilder.new.build_all_players
  end

  context "#self.sort_by_gender_and_lastname_ascending" do
    it "should return an array" do
      expect(Players.sort_by_gender_and_lastname_ascending(@players).class).to eq(Array)
    end

    it "should return females first and males last" do
      expect(Players.sort_by_gender_and_lastname_ascending(@players).first.gender).to eq("Female")
      expect(Players.sort_by_gender_and_lastname_ascending(@players).last.gender).to eq("Male")
    end

    it "should return females with ascending last names first" do
      expect(Players.sort_by_gender_and_lastname_ascending(@players).first.last_name).to eq("Hingis")
      expect(Players.sort_by_gender_and_lastname_ascending(@players).last.last_name).to eq("Smith")
    end
  end

  context "#self.sort_oldest_to_youngest" do
    it "should return an array" do
      expect(Players.sort_oldest_to_youngest(@players).class).to eq(Array)
    end

    it "should return the oldest player first" do
      expect(Players.sort_oldest_to_youngest(@players).first.last_name).to eq("Abercrombie")
      expect(Players.sort_oldest_to_youngest(@players).last.last_name).to eq("Smith")
    end
  end

  context "#self.sort_by_lastname_descending" do
    it "should return an array" do
      expect(Players.sort_by_lastname_descending(@players).class).to eq(Array)
    end

    it "should return descending last names first" do
      expect(Players.sort_by_lastname_descending(@players).first.last_name).to eq("Smith")
      expect(Players.sort_by_lastname_descending(@players).last.last_name).to eq("Abercrombie")
    end
  end 
end

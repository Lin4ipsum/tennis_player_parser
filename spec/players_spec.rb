require_relative "../models/players.rb" 
require_relative "../models/player_builder.rb" 

describe Players do
  before do
    p = PlayerBuilder.new
    @players = p.build_all_players
  end

  context "#self.sort_by_gender_and_lastname_ascending" do
    it "should return an array" do
      Players.sort_by_gender_and_lastname_ascending(@players).class.should == Array
    end

    it "should return females first and males last" do
      Players.sort_by_gender_and_lastname_ascending(@players).first.gender.should == "Female"
      Players.sort_by_gender_and_lastname_ascending(@players).last.gender.should == "Male"
    end

    it "should return females with ascending last names first" do
      Players.sort_by_gender_and_lastname_ascending(@players).first.last_name.should == "Hingis"
      Players.sort_by_gender_and_lastname_ascending(@players).last.last_name.should == "Smith"
    end
  end

  context "#self.sort_oldest_to_youngest" do
    it "should return an array" do
      Players.sort_oldest_to_youngest(@players).class.should == Array 
    end

    it "should return the oldest player first" do
      Players.sort_oldest_to_youngest(@players).first.last_name.should == "Abercrombie"
      Players.sort_oldest_to_youngest(@players).last.last_name.should == "Smith"
    end

  end

  context "#self.sort_by_lastname_descending" do
    it "should return an array" do
      Players.sort_by_lastname_descending(@players).class.should == Array 
    end

    it "should return descending last names first" do
      Players.sort_by_lastname_descending(@players).first.last_name.should == "Smith"
      Players.sort_by_lastname_descending(@players).last.last_name.should == "Abercrombie"
    end
  end 
end

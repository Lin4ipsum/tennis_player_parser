require_relative "../models/players_sorter.rb" 
require_relative "../models/players_builder.rb" 

describe PlayersSorter do
  before do
    data1 = [{:last_name=>"Smith", :first_name=>"Steve", :gender=>"M", :date_of_birth=>"3-3-1985", :favorite_color=>"Red"}, {:last_name=>"Bonk", :first_name=>"Radek", :gender=>"M", :date_of_birth=>"6-3-1975", :favorite_color=>"Green"}, {:last_name=>"Bouillon", :first_name=>"Francis", :gender=>"M", :date_of_birth=>"6-3-1975", :favorite_color=>"Blue"}]
    data2 = [{:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :date_of_birth=>"2/13/1943", :favorite_color=>"Tan"}, {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :date_of_birth=>"4/23/1967", :favorite_color=>"Yellow"}, {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :date_of_birth=>"7/12/1959", :favorite_color=>"Pink"}]
    data3 = [{:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"F", :date_of_birth=>"6-3-1975", :favorite_color=>"Red"}, {:last_name=>"Hingis", :first_name=>"Martina", :gender=>"F", :date_of_birth=>"4-2-1979", :favorite_color=>"Green"}, {:last_name=>"Seles", :first_name=>"Monica", :gender=>"F", :date_of_birth=>"12-2-1973", :favorite_color=>"Black"}]
    p = PlayersBuilder.new
    p.build_players(data1)
    p.build_players(data2)
    p.build_players(data3)
    @players = p.all_players
  end

  context "#self.sort_by_gender_and_lastname_ascending" do
    it "should return an array" do
      expect(PlayersSorter.sort_by_gender_and_lastname_ascending(@players).class).to eq(Array)
    end

    it "should return females first and males last" do
      expect(PlayersSorter.sort_by_gender_and_lastname_ascending(@players).first.gender).to eq("Female")
      expect(PlayersSorter.sort_by_gender_and_lastname_ascending(@players).last.gender).to eq("Male")
    end

    it "should return females with ascending last names first" do
      expect(PlayersSorter.sort_by_gender_and_lastname_ascending(@players).first.last_name).to eq("Hingis")
      expect(PlayersSorter.sort_by_gender_and_lastname_ascending(@players).last.last_name).to eq("Smith")
    end
  end

  context "#self.sort_oldest_to_youngest" do
    it "should return an array" do
      expect(PlayersSorter.sort_oldest_to_youngest(@players).class).to eq(Array)
    end

    it "should return the oldest player first" do
      expect(PlayersSorter.sort_oldest_to_youngest(@players).first.last_name).to eq("Abercrombie")
      expect(PlayersSorter.sort_oldest_to_youngest(@players).last.last_name).to eq("Smith")
    end
  end

  context "#self.sort_by_lastname_descending" do
    it "should return an array" do
      expect(PlayersSorter.sort_by_lastname_descending(@players).class).to eq(Array)
    end

    it "should return descending last names first" do
      expect(PlayersSorter.sort_by_lastname_descending(@players).first.last_name).to eq("Smith")
      expect(PlayersSorter.sort_by_lastname_descending(@players).last.last_name).to eq("Abercrombie")
    end
  end 
end

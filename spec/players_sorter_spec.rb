require_relative "../models/players_sorter.rb" 
require_relative "../models/players_builder.rb" 

describe PlayersSorter do
  before do
    data1 = [["Smith", "Steve", "M", "3-3-1985", "Red"], ["Bonk", "Radek", "M", "6-3-1975", "Green"], ["Bouillon", "Francis", "M", "6-3-1975", "Blue"]]
    data2 = [["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"], ["Bishop", "Timothy", "Male", "4/23/1967", "Yellow"], ["Kelly", "Sue", "Female", "7/12/1959", "Pink"]]
    data3 = [["Kournikova", "Anna", "F", "6-3-1975", "Red"], ["Hingis", "Martina", "F", "4-2-1979", "Green"], ["Seles", "Monica", "F", "12-2-1973", "Black"]]
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

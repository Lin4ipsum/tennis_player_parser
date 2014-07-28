require_relative "../models/printer.rb" 
require_relative "../models/players_builder.rb" 
require_relative "fixtures/printer_fixture.rb"

describe Printer do
  before do
    data1 = [{:last_name=>"Smith", :first_name=>"Steve", :gender=>"M", :date_of_birth=>"3-3-1985", :favorite_color=>"Red"}, {:last_name=>"Bonk", :first_name=>"Radek", :gender=>"M", :date_of_birth=>"6-3-1975", :favorite_color=>"Green"}, {:last_name=>"Bouillon", :first_name=>"Francis", :gender=>"M", :date_of_birth=>"6-3-1975", :favorite_color=>"Blue"}]
    data2 = [{:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :date_of_birth=>"2/13/1943", :favorite_color=>"Tan"}, {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :date_of_birth=>"4/23/1967", :favorite_color=>"Yellow"}, {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :date_of_birth=>"7/12/1959", :favorite_color=>"Pink"}]
    data3 = [{:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"F", :date_of_birth=>"6-3-1975", :favorite_color=>"Red"}, {:last_name=>"Hingis", :first_name=>"Martina", :gender=>"F", :date_of_birth=>"4-2-1979", :favorite_color=>"Green"}, {:last_name=>"Seles", :first_name=>"Monica", :gender=>"F", :date_of_birth=>"12-2-1973", :favorite_color=>"Black"}]
    p = PlayersBuilder.new
    players_one = p.build_players(data1)
    players_two = p.build_players(data2)
    players_three = p.build_players(data3)
    @players = players_one + players_two + players_three
  end

  context "#print_output_one" do
    it "should have Output as it's first line" do
      expect(Printer.print_output_one(@players).split("\n").first).to eq("Output 1:")
    end
    
    it "should have Output as it's first line" do
      expect(Printer.print_output_one(@players).split("\n").last).to eq("Smith Steve Male 03/03/1985 Red")
    end

    it "should have output equal to expected output" do
      expect(Printer.print_output_one(@players)).to eq(PrinterFixture.expected_output_one)
    end
   end

  context "#print_output_two" do
    it "should have output equal to expected output" do
      expect(Printer.print_output_two(@players)).to eq(PrinterFixture.expected_output_two)
    end
  end

  context "#print_output_three" do
    it "should have output equal to expected output" do
      expect(Printer.print_output_three(@players)).to eq(PrinterFixture.expected_output_three)
    end
  end

  context "#print_all_outputs" do
    it "should have output equal to expected outputs" do
      expect(Printer.print_all_outputs(@players)).to eq(nil)
    end
  end

  context "#print_player_attributes" do
    it "should print a string of player attributes" do
      expect(Printer.print_player_attributes(@players)).to eq(PrinterFixture.expected_player_attributes)
    end
  end
end

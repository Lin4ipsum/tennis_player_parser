require_relative "../models/printer.rb" 
require_relative "../models/players_builder.rb" 
require_relative "fixtures/printer_fixture.rb"

describe Printer do
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
      expect(Printer.print_all_outputs(@players)).to eq(PrinterFixture.all_expected_outputs)
      puts Printer.print_all_outputs(@players)
    end
  end

  context "#print_player_attributes" do
    it "should print a string of player attributes" do
      expect(Printer.print_player_attributes(@players)).to eq(PrinterFixture.expected_player_attributes)
    end
  end
end

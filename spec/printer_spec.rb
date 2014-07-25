require_relative "../models/printer.rb" 
require_relative "fixtures/printer_fixture.rb"

describe Printer do
  before do
    @players = PlayerBuilder.new.build_all_players
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
    end
  end

  context "#print_player_attributes" do
    it "should print a string of player attributes" do
      expect(Printer.print_player_attributes(@players)).to eq(PrinterFixture.expected_player_attributes)
    end
  end
end

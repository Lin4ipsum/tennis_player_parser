require_relative "../models/printer.rb" 
require_relative "fixtures/printer_fixture.rb"

describe Printer do
  context "#print_output_one" do
    it "should have output equal to expected output" do
      Printer.print_output_one.should == PrinterFixture.expected_output_one
    end
  end

  context "#print_output_two" do
    it "should have output equal to expected output" do
      Printer.print_output_two.should == PrinterFixture.expected_output_two
    end
  end

  context "#print_output_three" do
    it "should have output equal to expected output" do
      Printer.print_output_three.should == PrinterFixture.expected_output_three
    end
  end

  context "#print_all_outputs" do
    it "should have output equal to expected outputs" do
      Printer.print_all_outputs.should == PrinterFixture.all_expected_outputs
    end
  end

  context "#printplayer_attributes" do
    it "should print a string of player attributes" do
      players = Printer.instantiate_players
      Printer.print_player_attributes(players).should == PrinterFixture.expected_player_attributes
    end
  end

  context "#instantiate_players" do
    it "should return an array of Players" do
      Printer.instantiate_players.class.should == Array
      Printer.instantiate_players.first.class.should == Player
    end
  end
end

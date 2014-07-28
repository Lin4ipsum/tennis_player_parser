require_relative 'player.rb'
require_relative 'players_builder.rb'
require_relative 'players_sorter.rb'
require 'rake'
require 'pp'

class Printer
  def self.print_output_one(players)
    gender_and_last_name = PlayersSorter.sort_by_gender_and_lastname_ascending(players)
    "Output 1:\n" + self.print_player_attributes(gender_and_last_name)
  end

  def self.print_output_two(players)
    oldest_to_youngest = PlayersSorter.sort_oldest_to_youngest(players)
    "Output 2:\n" + self.print_player_attributes(oldest_to_youngest)
  end

  def self.print_output_three(players)
    last_name_des = PlayersSorter.sort_by_lastname_descending(players)
    "Output 3:\n" + self.print_player_attributes(last_name_des)
  end

  def self.print_all_outputs(players)
    puts self.print_output_one(players) + "\n" + self.print_output_two(players) + "\n" + self.print_output_three(players)
  end

  def self.print_player_attributes(players)
    sorted_players = ""
    players.each do |x|
       sorted_players += "#{x.last_name} #{x.first_name} #{x.gender} #{x.date_of_birth.strftime('%m/%d/%Y')} #{x.favorite_color}\n"
    end
    sorted_players
  end
end

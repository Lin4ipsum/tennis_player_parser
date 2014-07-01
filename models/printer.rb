require_relative 'importer.rb'
require_relative 'player.rb'
require_relative 'sorter.rb'
require 'rake'
require 'pp'

class Printer

  def print_output_one
    sorted_players = players.sort_by(gender, lastname, asc).to_s
    puts "Output 1:"
    puts sorted_players
  end

  def print_output_two
    print output_header("Output 2")
    sorted_players = instantiate_sorter.sort_oldest_to_youngest(instantiate_players)
    print_player_attributes(sorted_players)
  end

  def print_output_three
    print output_header("Output 3")
    sorted_players = instantiate_sorter.sort_by_lastname_descending(instantiate_players)
    print_player_attributes(sorted_players)
  end

  def print_all_outputs
    self.print_output_one
    puts "\n"
    self.print_output_two
    puts "\n"
    self.print_output_three
    puts "\n"
    ""
  end

  # def output_header(string)
  #   string + ": \n"
  # end

  def print_player_attributes(players)
    players.each do |x|
      puts "#{x.lastname} #{x.firstname} #{x.gender}"
       # + " " + x.dateofbirth + " " + x.favoritecolor
    end
  end

  def instantiate_players
    Importer.new.import_all_players 
  end

  # def instantiate_sorter
  #   Sorter.new
  # end
end

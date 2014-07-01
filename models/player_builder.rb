require_relative 'importer.rb'
require_relative 'player.rb'

class PlayerBuilder
  
  attr_accessor :all_players

  CONFIG = {
    :pipe  => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 5, favorite_color: 4}, 
    :comma => {last_name: 0, first_name: 1, gender: 2, date_of_birth: 4, favorite_color: 3},
    :space => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 4, favorite_color: 5}
  }

  def initialize
    @all_players = []
  end

  def build_all_players(file1="../src/pipe_delimited.txt", file2="../src/comma_delimited.txt", file3="../src/space_delimited.txt")
    build_players(Importer.import_file(file1), CONFIG[:pipe])
    build_players(Importer.import_file(file2), CONFIG[:comma])
    build_players(Importer.import_file(file3), CONFIG[:space])
    all_players.flatten
  end

  def build_players(data, config)
    @all_players << data.map do |player_data|
      build_player(player_data, config)
    end
  end

  def build_player(player_data, config)
    Player.new(
      player_data[config[:last_name]].strip,
      player_data[config[:first_name]].strip,
      format_gender(player_data[config[:gender]]).strip,
      format_dob(player_data[config[:date_of_birth]].strip),
      player_data[config[:favorite_color]].strip
     )
  end

  def format_dob(date_of_birth)
    formated_dob = date_of_birth.match("-") ? date_of_birth.gsub!("-", "/") : date_of_birth 
    DateTime.strptime(formated_dob, "%m/%d/%Y") 
  end
  
  def format_gender(gender)
    gender.match("F") ? "Female" : "Male"
  end
end

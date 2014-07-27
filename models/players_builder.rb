require_relative 'player.rb'
require 'date'

class PlayersBuilder
  
  attr_accessor :all_players

  def initialize
    @all_players = []
  end

  def build_players(data)
    data.each do |player_data|
      @all_players << build_player(player_data)
    end
    @all_players
  end

  def build_player(player_data)
    Player.new(
      player_data[0],
      player_data[1],
      format_gender(player_data[2]),
      format_dob(player_data[3]),
      player_data[4]
     )
  end

  def format_dob(date_of_birth)
    parsed = date_of_birth.include?('/') ? date_of_birth.split('/') : date_of_birth.split('-')
    Date.parse(parsed[2] + '-' + parsed[0] + '-' + parsed[1])
  end
  
  def format_gender(gender)
    gender.match("F") ? "Female" : "Male"
  end
end

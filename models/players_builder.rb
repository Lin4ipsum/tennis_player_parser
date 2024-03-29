require_relative 'player.rb'
require 'date'

class PlayersBuilder
  
  def build_players(data)
    players = []
    data.each do |player_data|
      players << build_player(player_data)
    end
    players
  end

  def build_player(player_data)
    Player.new(
      player_data[:last_name],
      player_data[:first_name],
      format_gender(player_data[:gender]),
      format_dob(player_data[:date_of_birth]),
      player_data[:favorite_color]
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

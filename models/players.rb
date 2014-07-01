require_relative 'players.rb'
require_relative 'player_builder.rb'
require 'date'

class Players
  def self.sort_by_gender_and_lastname_ascending(players)
    players.sort_by {|player| [player.gender, player.last_name] }
  end

  def self.sort_oldest_to_youngest(players)
    players.sort_by {|player| player.date_of_birth }
  end

  def self.sort_by_lastname_descending(players)
    players.sort_by {|player| player.last_name}.reverse
  end
end
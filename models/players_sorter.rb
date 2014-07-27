require_relative 'players_builder.rb'

class PlayersSorter
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
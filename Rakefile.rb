require_relative 'run.rb'

namespace :tennis_player_importer do
  desc "view all player output"
  task :view_all_player_output do
  	Run.print_sorted_tennis_players
  end
end

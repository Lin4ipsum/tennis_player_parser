# require_relative 'models/importer.rb'
# require_relative 'models/player.rb'
# require_relative 'models/players.rb'
# require_relative 'models/player_builder.rb'
require_relative 'models/printer.rb'
require 'date'

namespace :linda_code_test do
  desc "view all player output"
  task :view_all_player_output do
  Printer.instantiate_players("src/pipe_delimited.txt", "src/comma_delimited.txt", "src/space_delimited.txt")
  #Importer.import_players(file1, file2, file3)
  # Printer.print_all_outputs
  end
end


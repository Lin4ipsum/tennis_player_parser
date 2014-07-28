require_relative 'models/players_builder.rb'
require_relative 'models/importer.rb'
require_relative 'models/player_data_normalizer.rb'
require_relative 'models/printer.rb'

module Run
	def self.print_sorted_tennis_players
		i = Importer.new
		import_comma = i.import_file("data/comma_delimited.txt")
		import_space = i.import_file("data/space_delimited.txt")
		import_pipe = i.import_file("data/pipe_delimited.txt")

		pdn = PlayerDataNormalizer.new
		comma_normalized = pdn.normalize_data(import_comma)
		pipe_normalized = pdn.normalize_data(import_pipe)
		space_normalized = pdn.normalize_data(import_space)

		players_builder = PlayersBuilder.new
		players_builder.build_players(comma_normalized)
		players_builder.build_players(space_normalized)
		players_builder.build_players(pipe_normalized)
		#build array
		players = players_builder.all_players

		puts Printer.print_all_outputs(players)	
	end
end
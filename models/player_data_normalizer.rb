class PlayerDataNormalizer

	attr_accessor :delimiter, :player_data

	ORDER_CONFIG = {
    "|"  => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 5, favorite_color: 4}, 
    "," => {last_name: 0, first_name: 1, gender: 2, date_of_birth: 4, favorite_color: 3},
    " " => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 4, favorite_color: 5}
  }

	def determine_delimiter(data)
		case data
		when /\|/
			self.delimiter = "|"
		when /\,/
			self.delimiter = ","
		else
			self.delimiter = " "
		end
	end

	def tokenize(data)
		remove_delimiter = ["|", ","].include?(self.delimiter) ? data.gsub(self.delimiter, "") : data
		remove_delimiter.split("\n")
	end

	def build_player_hashes(stripped_data)
		stripped_data.map do |data|
			build_player_hash(data)
		end
	end

	def build_player_hash(data)
		data_array = data.split(" ")
		ordered_data = {}
		
		config = ORDER_CONFIG[self.delimiter]
		config.keys.each do |key|
			ordered_data[key] = data_array[config[key]]
		end
		ordered_data
	end

	def normalize_data(data)
		self.determine_delimiter(data)
		self.build_player_hashes(self.tokenize(data))
	end
end

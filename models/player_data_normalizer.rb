class PlayerDataNormalizer

	attr_accessor :delimiter

	ORDER_CONFIG = {
    "|" => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 5, favorite_color: 4}, 
    "," => {last_name: 0, first_name: 1, gender: 2, date_of_birth: 4, favorite_color: 3},
    " " => {last_name: 0, first_name: 1, gender: 3, date_of_birth: 4, favorite_color: 5}
  }

	def determine_delimiter(data)
		case data
		when /\|/
			@delimiter = "|"
		when /\,/
			@delimiter = ","
		else
			@delimiter = " "
		end
	end
# break this up into two methods
	def tokenize(data)
		stripped_data = ["|", ","].include?(self.delimiter) ? data.gsub(self.delimiter, "") : data
		stripped_data.split("\n")
	end

	def build_player_hashes(tokenized_data)
		tokenized_data.map do |data|
			build_player_hash(data)
		end
	end

	def build_player_hash(data)
		data_array = data.split(" ")
		config = ORDER_CONFIG[@delimiter]

		config.keys.inject({}) do |memo, key|
			memo[key] = data_array[config[key]]; memo
		end
	end

	def normalize_data(data)
		determine_delimiter(data)
		build_player_hashes(tokenize(data))
	end
end

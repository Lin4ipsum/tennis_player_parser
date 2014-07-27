class PlayerDataNormalizer

	attr_accessor :delimiter, :player_data

	ORDER_CONFIG = {
    "|"  => [0, 1, 3, 5, 4], 
    "," => [0, 1, 2, 4, 3],
    " " => [0, 1, 3, 4, 5]
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

	def strip_data(data)
		remove_delimiter = ["|", ","].include?(self.delimiter) ? data.gsub(self.delimiter, "") : data
		remove_delimiter.split("\n")
	end

	def build_player_data(stripped_data, config)
		player_data = []
		stripped_data.each do |data|
			player_data << order_data(data, config)
		end
		self.player_data = player_data
	end

	def order_data(data, config)
		data_array = data.split(" ")
		order = ORDER_CONFIG[self.delimiter]
		players = []
		order.each do |x|
			players << data_array[x]
		end
		players
	end

	def normalize_data(data)
		self.determine_delimiter(data)
		self.build_player_data(self.strip_data(data), self.delimiter)
	end
end


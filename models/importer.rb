class Importer
	def import_file(filepath)
		File.read(filepath)
	end
end

# "Smith | Steve | D | M | Red | 3-3-1985\n
# Bonk | Radek | S | M | Green | 6-3-1975\n
# Bouillon | Francis | G | M | Blue | 6-3-1975"


# "Abercrombie, Neil, Male, Tan, 2/13/1943\n
# Bishop, Timothy, Male, Yellow, 4/23/1967\n
# Kelly, Sue, Female, Pink, 7/12/1959"
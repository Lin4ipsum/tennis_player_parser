require 'csv'

class Importer

	def self.determine_delimiter(filename)
		if File.read(filename).include?("|")
			"|"
		elsif File.read(filename).include?(",")
			","
		else
			" "
		end
	end

	def self.import_file(filename)
		delimiter = determine_delimiter(filename)
		CSV.read(filename, :col_sep => delimiter)
	end
end
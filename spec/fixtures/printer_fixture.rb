class PrinterFixture

  def self.expected_output_one
<<-EOS
Output 1:
Hingis Martina Female 04/02/1979 Green
Kelly Sue Female 07/12/1959 Pink
Kournikova Anna Female 06/03/1975 Red
Seles Monica Female 12/02/1973 Black
Abercrombie Neil Male 02/13/1943 Tan
Bishop Timothy Male 04/23/1967 Yellow
Bonk Radek Male 06/03/1975 Green
Bouillon Francis Male 06/03/1975 Blue
Smith Steve Male 03/03/1985 Red
EOS
  end

  def self.expected_output_two
<<-EOS
Output 2:
Abercrombie Neil Male 02/13/1943 Tan
Kelly Sue Female 07/12/1959 Pink
Bishop Timothy Male 04/23/1967 Yellow
Seles Monica Female 12/02/1973 Black
Bouillon Francis Male 06/03/1975 Blue
Bonk Radek Male 06/03/1975 Green
Kournikova Anna Female 06/03/1975 Red
Hingis Martina Female 04/02/1979 Green
Smith Steve Male 03/03/1985 Red
EOS
  end

  def self.expected_output_three
<<-EOS
Output 3:
Smith Steve Male 03/03/1985 Red
Seles Monica Female 12/02/1973 Black
Kournikova Anna Female 06/03/1975 Red
Kelly Sue Female 07/12/1959 Pink
Hingis Martina Female 04/02/1979 Green
Bouillon Francis Male 06/03/1975 Blue
Bonk Radek Male 06/03/1975 Green
Bishop Timothy Male 04/23/1967 Yellow
Abercrombie Neil Male 02/13/1943 Tan
EOS
  end

  def self.all_expected_outputs
    puts expected_output_one + expected_output_two + expected_output_three
  end

  def self.expected_player_attributes
<<-EOS
Smith Steve Male 03/03/1985 Red
Bonk Radek Male 06/03/1975 Green
Bouillon Francis Male 06/03/1975 Blue
Abercrombie Neil Male 02/13/1943 Tan
Bishop Timothy Male 04/23/1967 Yellow
Kelly Sue Female 07/12/1959 Pink
Kournikova Anna Female 06/03/1975 Red
Hingis Martina Female 04/02/1979 Green
Seles Monica Female 12/02/1973 Black
EOS
  end

end
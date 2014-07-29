README:

// WHAT IT DOES:
This is a ruby program that makes a single set of tennis player records by parsing data from 3 different record files. A tennis player record consists of a last name, first name, gender, data of birth, and favorite color. 

// HOW TO RUN IT:
1. cd to tennis_player_importer
2. bundle install
3. type 'rake run' in terminal to see tennis player output
4. type 'rake tests' in terminal to view all tests
note: rake -T (command to list all of the rake tasks)

// HOW IT WORKS:
The data from these 3 files has been parsed and aggregated into the following 3 outputs:
Output 1 – sorted by gender (females before males) then by last name ascending.
Output 2 – sorted by birth date, ascending.
Output 3 – sorted by last name, descending.


// EXAMPLE OUTPUT;
This is an example of Desired Outcome: 

Output 1:
Hingis Martina Female 4/2/1979 Green
Kelly Sue Female 7/12/1959 Pink
Kournikova Anna Female 6/3/1975 Red
Seles Monica Female 12/2/1973 Black
Abercrombie Neil Male 2/13/1943 Tan
Bishop Timothy Male 4/23/1967 Yellow
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Smith Steve Male 3/3/1985 Red

Output 2:
Abercrombie Neil Male 2/13/1943 Tan
Kelly Sue Female 7/12/1959 Pink
Bishop Timothy Male 4/23/1967 Yellow
Seles Monica Female 12/2/1973 Black
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Kournikova Anna Female 6/3/1975 Red
Hingis Martina Female 4/2/1979 Green
Smith Steve Male 3/3/1985 Red

Output 3:
Smith Steve Male 3/3/1985 Red
Seles Monica Female 12/2/1973 Black
Kournikova Anna Female 6/3/1975 Red
Kelly Sue Female 7/12/1959 Pink
Hingis Martina Female 4/2/1979 Green
Bouillon Francis Male 6/3/1975 Blue
Bonk Radek Male 6/3/1975 Green
Bishop Timothy Male 4/23/1967 Yellow
Abercrombie Neil Male 2/13/1943 Tan

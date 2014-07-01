require_relative "../models/player_builder.rb" 

describe PlayerBuilder do 
  it "should set @all_players to an empty array on initialization" do
    p = PlayerBuilder.new
    p.all_players.should == []
  end

  it "should be able to get and set all players" do
    p = PlayerBuilder.new
    p.all_players.push("Homer Simpson")
    p.all_players.should == ["Homer Simpson"]
  end

  context "#build_all_players" do
    before do
      @p = PlayerBuilder.new
    end
    it "shoud return an array" do
      @p.build_all_players.class.should == Array
    end

    it "should return an array containing Players" do
      @p.build_all_players.first.class.should == Player
    end

    it "should return an array with 9 players" do
      @p.build_all_players.length.should == 9
    end
  end


  context "#build_player" do
    before do
      @p = PlayerBuilder.new
      @player = ["Smith", "Steve", "D", "M", "Red", "3/3/1985"]
    end

    it "should build a player" do
      @p.build_player(@player, PlayerBuilder::CONFIG[:pipe]).class.should == Player
    end

    it "should correctly assign player attributes" do
      player = @p.build_player(@player, PlayerBuilder::CONFIG[:pipe])
      player.first_name.should == "Steve"
      player.favorite_color.should == "Red"
    end
  end

  context "#build_players" do
    before do
      @p = PlayerBuilder.new
      @config = PlayerBuilder::CONFIG[:pipe]
      @data = Importer.import_file("../src/pipe_delimited.txt")
    end
    
    it "should return an array" do
      @p.build_players(@data, @config).class.should == Array
    end

    it "should return an array containing players" do
      @p.build_players(@data, @config)[0][0].class.should == Player
    end
  end

  context "format_dob" do
    it "should return a DateTime class object" do
      @p = PlayerBuilder.new
      @data = Importer.import_file("../src/pipe_delimited.txt")
      @p.build_players(@data, PlayerBuilder::CONFIG[:pipe])
      @p.all_players[0][0].date_of_birth.class.should == DateTime
    end
  end

  context "format_gender" do
    it "should return Male" do
      @p = PlayerBuilder.new
      @data = Importer.import_file("../src/pipe_delimited.txt")
      @p.build_players(@data, PlayerBuilder::CONFIG[:pipe])
      @p.all_players[0][0].gender.should == "Male"
    end

    it "should return Female" do
      @p = PlayerBuilder.new
      @data = Importer.import_file("../src/space_delimited.txt")
      @p.build_players(@data, PlayerBuilder::CONFIG[:space])
      @p.all_players[0][0].gender.should == "Female"
    end
  end
end
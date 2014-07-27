require_relative "../models/players_builder.rb" 

describe PlayersBuilder do 
  before do
    @p = PlayersBuilder.new
  end

  it "should set @all_players to an empty array on initialization" do
    expect(@p.all_players).to eq([])
  end

  it "should be able to get and set all players" do
    @p.all_players.push("Homer Simpson")
    expect(@p.all_players).to eq(["Homer Simpson"])
  end

  context "#build_player" do
    before do
      @data = ["Smith", "Steve", "M", "3-3-1985", "Red"]
    end

    it "should build a player" do
      expect(@p.build_player(@data).class).to eq(Player)
    end

    it "should correctly assign player attributes" do
      player = @p.build_player(@data)
      expect(player.first_name).to eq("Steve")
      expect(player.favorite_color).to eq("Red")
    end
  end

  context "#build_players" do
    before do
      @data = [["Smith", "Steve", "M", "3-3-1985", "Red"], ["Bonk", "Radek", "M", "6-3-1975", "Green"], ["Bouillon", "Francis", "M", "6-3-1975", "Blue"]]
    end
    
    it "should return an array" do
      expect(@p.build_players(@data).class).to eq(Array)
    end

    it "should return an array containing players" do
      expect(@p.build_players(@data).first.class).to eq(Player)
    end

    it "should build multiple players" do
      @p.build_players(@data)
      data = [["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"], ["Bishop", "Timothy", "Male", "4/23/1967", "Yellow"], ["Kelly", "Sue", "Female", "7/12/1959", "Pink"]]
      @p.build_players(data)
      expect(@p.all_players.class).to eq(Array)
      expect(@p.all_players.first.class).to eq(Player)
    end
  end

  context "format_dob" do
    it "should return a properly convert string to Date" do
      date = "2-13-1943"
      expect(@p.format_dob(date).class).to eq(Date)
    end
  end

  context "format_gender" do
    it "should return Male" do
      @data = ["Smith", "Steve", "M", "3-3-1985", "Red"]
      player = @p.build_player(@data)
      expect(player.gender).to eq("Male")
    end

    it "should return Female" do
      @data = ["Kelly", "Sue", "Female", "7/12/1959", "Pink"]
      player = @p.build_player(@data)
      expect(player.gender).to eq("Female")
    end
  end
end
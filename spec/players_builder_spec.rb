require_relative "../models/players_builder.rb" 

describe PlayersBuilder do 
  before do
    @p = PlayersBuilder.new
  end

  context "#build_player" do
    before do
      @data = {:last_name=>"Smith", :first_name=>"Steve", :gender=>"M", :date_of_birth=>"3-3-1985", :favorite_color=>"Red"}
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
      @data = [{:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"F", :date_of_birth=>"6-3-1975", :favorite_color=>"Red"}, {:last_name=>"Hingis", :first_name=>"Martina", :gender=>"F", :date_of_birth=>"4-2-1979", :favorite_color=>"Green"}, {:last_name=>"Seles", :first_name=>"Monica", :gender=>"F", :date_of_birth=>"12-2-1973", :favorite_color=>"Black"}]
    end
    
    it "should return an array" do
      expect(@p.build_players(@data).class).to eq(Array)
    end

    it "should return an array containing players" do
      expect(@p.build_players(@data).first.class).to eq(Player)
    end

    it "should build multiple players" do
      players = @p.build_players(@data)
      expect(players.class).to eq(Array)
      expect(players.first.class).to eq(Player)
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
      data = {:last_name=>"Smith", :first_name=>"Steve", :gender=>"M", :date_of_birth=>"3-3-1985", :favorite_color=>"Red"}
      player = @p.build_player(data)
      expect(player.gender).to eq("Male")
    end

    it "should return Female" do
      data = {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"F", :date_of_birth=>"6-3-1975", :favorite_color=>"Red"}
      player = @p.build_player(data)
      expect(player.gender).to eq("Female")
    end
  end
end
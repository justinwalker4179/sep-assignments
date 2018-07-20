include RSpec
require_relative 'cities'
describe City do
  describe "initialize" do
    it "has a name property" do
      city = City.new("TheCity")
      expect(city.name).to eq("TheCity")
    end

    it "has not been visited" do
      city = City.new("TheCity")
      expect(city.visited).to eq(false)
    end

    it "has empty neighbors array" do
      city = City.new("TheCity")
      expect(city.neighbors).to eq([])
    end
  end

  describe "#add_neighbor" do
    it "adds neighbor city to self" do
      city = City.new("TheCity")
      city2 = City.new("TheOtherCity")
      city.add_neighbor(city2,3)
      expect(city.neighbors.first.first.name).to eq("TheOtherCity")
    end

    it "adds self to neighbor city array" do
      city = City.new("TheCity")
      city2 = City.new("TheOtherCity")
      city.add_neighbor(city2,3)
      expect(city2.neighbors.first.first.name).to eq("TheCity")
    end

    it "keeps track of distance between cities" do
      city = City.new("TheCity")
      city2 = City.new("TheOtherCity")
      city.add_neighbor(city2,3)
      expect(city2.neighbors.first.last).to eq(3)
    end
  end
end
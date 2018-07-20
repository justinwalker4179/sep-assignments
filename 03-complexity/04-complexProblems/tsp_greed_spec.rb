include RSpec
require_relative 'tsp_greed'

describe "#nearest_possible_neighbor" do
  let(:city1) {City.new("city1")}
  let(:city2) {City.new("city2")}
  let(:city3) {City.new("city3")}
  let(:city4) {City.new("city4")}
  let(:city5) {City.new("city5")}

  it "visits first city" do
    city_array = [city1]
    nearest_possible_neighbor(city_array, city1)
    expect(city1.visited).to eq(true)
  end

  it "visits two cities" do
    city_array = [city1, city2]
    city1.add_neighbor(city2,6)
    nearest_possible_neighbor(city_array, city1)
    expect(city2.visited).to eq(true)
  end

  it "visits all citiess" do
    city_array = [city1, city2, city3, city4, city5]
    city1.add_neighbor(city2,6)
    city2.add_neighbor(city5,3)
    city4.add_neighbor(city5,7)
    city1.add_neighbor(city5,1)
    nearest_possible_neighbor(city_array, city1)
    expect(city1.visited).to eq(true)
    expect(city2.visited).to eq(true)
    expect(city3.visited).to eq(true)
    expect(city4.visited).to eq(true)
    expect(city5.visited).to eq(true)
  end

  it "visits cities in order" do
    city_array = [city1, city2, city3, city4, city5]
    city1.add_neighbor(city2,6)
    city2.add_neighbor(city5,3)
    city4.add_neighbor(city5,7)
    city1.add_neighbor(city5,1)
    nearest_possible_neighbor(city_array, city1)
    expect(city1.visited).to eq(true)
    expect(city2.visited).to eq(true)
    expect(city3.visited).to eq(true)
    expect(city4.visited).to eq(true)
    expect(city5.visited).to eq(true)
  end
end
class City
  attr_accessor :name
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize(name)
    self.name = name
    self.visited = false
    self.neighbors = []
  end

  def add_neighbor(city, distance)
    self.neighbors.push([city,distance])
    city.neighbors.push([self,distance])
  end
end
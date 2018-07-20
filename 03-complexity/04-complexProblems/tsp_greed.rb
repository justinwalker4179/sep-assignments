require_relative 'cities'
def nearest_possible_neighbor(graph_of_cities, current_city)
  for city in graph_of_cities
    current_city = city
    while current_city != nil && current_city.visited == false
      if current_city.neighbors.length > 0
        neighbor_cities = current_city.neighbors
        next_city = neighbor_cities.first

        for current_neighbor in neighbor_cities
          if current_neighbor.last < next_city.last
            current_neighbor = next_city
          end
        end
      end
      current_city.visited = true
      current_city = next_city.first if next_city != nil
    end
  end
end
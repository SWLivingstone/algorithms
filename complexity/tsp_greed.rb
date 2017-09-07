class City
  attr_accessor :visited
  attr_accessor :neighbors
  attr_accessor :city_name

  def initialize(city_name)
    @visited = false
    @neighbors = []
    @city_name = city_name
  end

  # @neighbors is an array of sub-arrays.  Each sub-array contains a neighbor
  # and a distance to that neighbor
  def add_neighbors(*neighbors)
    neighbors.each do |neighbor|
      @neighbors << neighbor
      @neighbors.flatten!(1)
    end
  end
end



def nearest_neighbor(graph_of_cities, current_city)
  route = []
  while current_city&.visited == false
    neighbor_cities = current_city.neighbors
    next_city = nil
    next_city_distance = Float::INFINITY
    neighbor_cities.each do |current_neighbor|
      current_neighbor_distance = current_neighbor[1]
      if (current_neighbor_distance < next_city_distance) && (current_neighbor[0].visited == false)
        next_city = current_neighbor[0]
        next_city_distance = current_neighbor[1]
      end
    end
    current_city.visited = true
    route << current_city.city_name
    current_city = next_city
  end
  route
end


def build_city(size)
  array_of_cities = []
  city_number = 0
  size.times do
    array_of_cities << City.new("City #{city_number}")
    city_number += 1
  end
  array_of_cities
end

array_of_cities = build_city(8)

array_of_cities[0].add_neighbors([[array_of_cities[2], 4], [array_of_cities[6], 2]])
array_of_cities[1].add_neighbors([[array_of_cities[6], 1], [array_of_cities[7], 6], [array_of_cities[3], 5]])
array_of_cities[2].add_neighbors([[array_of_cities[0], 4], [array_of_cities[4], 2], [array_of_cities[7], 3], [array_of_cities[5], 4]])
array_of_cities[3].add_neighbors([[array_of_cities[1], 5], [array_of_cities[7], 1], [array_of_cities[5], 4]])
array_of_cities[4].add_neighbors([[array_of_cities[6], 2], [array_of_cities[2], 2], [array_of_cities[7], 1]])
array_of_cities[5].add_neighbors([[array_of_cities[3], 4], [array_of_cities[7], 1], [array_of_cities[2], 4]])
array_of_cities[6].add_neighbors([[array_of_cities[0], 2], [array_of_cities[4], 2], [array_of_cities[1], 1]])
array_of_cities[7].add_neighbors([[array_of_cities[1], 6], [array_of_cities[4], 1], [array_of_cities[2], 3], [array_of_cities[5], 1], [array_of_cities[3], 4]])

cities = build_city(4)

cities[0].add_neighbors([[cities[1], 2], [cities[3], 5], [cities[2], 3]])
cities[1].add_neighbors([[cities[2], 6], [cities[3], 3], [cities[0], 2]])
cities[2].add_neighbors([[cities[0], 3], [cities[1], 6], [cities[3], 4]])
cities[3].add_neighbors([[cities[2], 4], [cities[0], 5], [cities[1], 3]])

p nearest_neighbor(array_of_cities, array_of_cities[0])
p nearest_neighbor(cities, cities[0])

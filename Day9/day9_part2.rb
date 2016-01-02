lines = File.readlines('day9_inputs.txt')

route1, route2, placeA, placeB = '', '', '', ''
distance, current_distance = 0, 0
matches, places, permutationPlaces = [], [], []
routes = {}
longest_distance = 0

lines.each do |line|
  matches = line.match(/(\w+)( to )(\w+)/)
  route1 = matches[0]
  placeA = matches[1]
  placeB = matches[3]
  distance = line[/\d+/].to_i

  routes[route1] = distance

  [placeA, placeB].each do |place|
    unless places.include?(place)
      places << place
    end
  end
end

permutationPlaces = places.permutation.to_a

permutationPlaces.each do |places|
  current_distance = 0
  placeA, placeB = '', ''

  places.each do |place|
    if placeA == ''
      placeA = place
    else
      placeB = place
      route1 = "#{placeA} to #{placeB}"
      route2 = "#{placeB} to #{placeA}"
      distance = routes.has_key?(route1) ? routes[route1].to_i : routes[route2].to_i
      current_distance += distance
      placeA = placeB
      placeB = ''
    end
  end

  if longest_distance < current_distance
    longest_distance = current_distance
  end
end

puts "The distance of the longest route is #{longest_distance}"

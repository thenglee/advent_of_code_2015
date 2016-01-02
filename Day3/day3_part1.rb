file = File.read('day3_inputs.txt')

x = 0
y = 0
houses = 1
houses_visited = {}

moves = file.chars

moves.each do |move|
  if move == '^'
    x += 1
  end

  if move == 'v'
    x -= 1
  end

  if move == '>'
    y += 1
  end

  if move == '<'
    y -= 1
  end

  coordinates = "#{x}x#{y} "

  unless houses_visited.has_key?(coordinates)
    houses_visited[coordinates] = 1
    houses += 1
  end
end

puts "Unique houses visited is #{houses}."

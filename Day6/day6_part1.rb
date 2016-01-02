lines = File.readlines('day6_inputs.txt')

lights = Array.new(1000) { Array.new(1000, false) }
coords = []
count = 0

lines.each do |line|
  coords = line.scan(/\d+/).map(&:to_i)
  action = line[/([a-z]+\s){1,2}/].strip

  (coords[0]..coords[2]).each do |coord_x|
    (coords[1]..coords[3]).each do |coord_y|
      if action == 'toggle'
        lights[coord_x][coord_y] = !lights[coord_x][coord_y]
      elsif action == 'turn on'
        lights[coord_x][coord_y] = true
      else
        lights[coord_x][coord_y] = false
      end
    end
  end
end

lights.each do |x|
  x.each do |light_on|
    count += 1 if light_on == true
  end
end

puts "Total number of lights lit: #{count}."

lines = File.readlines('day6_inputs.txt')

lights = Array.new(1000) { Array.new(1000, 0) }
coords = []
count = 0

lines.each do |line|
  coords = line.scan(/\d+/).map(&:to_i)
  action = line[/([a-z]+\s){1,2}/].strip

  (coords[0]..coords[2]).each do |coord_x|
    (coords[1]..coords[3]).each do |coord_y|
      if action == 'toggle'
        lights[coord_x][coord_y] += 2
      elsif action == 'turn on'
        lights[coord_x][coord_y] += 1
      else
        lights[coord_x][coord_y] -= 1 if lights[coord_x][coord_y] > 0
      end
    end
  end
end

lights.each do |x|
  x.each do |light|
    count += light
  end
end

puts "Total brightness of all lights: #{count}."

# References
# http://www.zytrax.com/tech/web/regex.htm

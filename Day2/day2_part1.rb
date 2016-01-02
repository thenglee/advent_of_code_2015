lines = File.readlines('day2_inputs.txt')

l = 0
w = 0
h = 0
box_area = 0
total = 0

lines.each do |line|
  dimension = line.split('x').map(&:to_i).sort
  l = dimension[0]
  w = dimension[1]
  h = dimension[2]

  box_area = 2*l*w + 2*w*h + 2*h*l + l*w
  total += box_area
end

puts "Total sq feet is #{total}."
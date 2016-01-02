lines = File.readlines('day2_inputs.txt')

l = 0
w = 0
h = 0
ribbon_length = 0
total = 0

lines.each do |line|
  dimension = line.split('x').map(&:to_i).sort
  l = dimension[0]
  w = dimension[1]
  h = dimension[2]

  ribbon_length = 2*l + 2*w + l*w*h
  total += ribbon_length
end

puts "Total ribbon feet is #{total}."
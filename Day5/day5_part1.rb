lines = File.readlines('day5_inputs.txt')

nice_string_count = 0

lines.each do |line|
  next if line.match('ab|cd|pq|xy')

  next if !(line.match('([a-z])\1'))

  nice_string_count += 1 if line.count('aeiou') >= 3
end

puts "Number of nice string is #{nice_string_count}."

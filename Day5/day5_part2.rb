lines = File.readlines('day5_inputs.txt')

nice_string_count = 0
has_repeat_pairs = false

lines.each do |line|
  has_repeat_pairs = false
  last_index = line.size - 1

  (0..last_index - 2).each do |i|
    checking_str = line[i,2]
    trailing_str = line[i+2..last_index]
    if trailing_str.include? checking_str
      has_repeat_pairs = true
      break
    end
  end

  if has_repeat_pairs
    (0..(last_index - 2)).each do |i|
      current_char = line[i]
      next_next_char = line[i+2]
      if current_char == next_next_char
      	nice_string_count += 1
      	break
      end
    end
  end
end

puts "Number of nice string is #{nice_string_count}."

# references
# http://www.tutorialspoint.com/ruby/ruby_loops.htm
# http://www.dotnetperls.com/substring-ruby
# ex9: http://www.zytrax.com/tech/web/regex.htm

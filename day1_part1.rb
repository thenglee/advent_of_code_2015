file = File.open('day1_inputs.txt', 'r')
input = file.read

current = 0

characters = input.chars

characters.each do |character|
  if character == '('
    current += 1
  end

  if character == ')'
    current -= 1
  end
end

puts "The current level is #{current}."

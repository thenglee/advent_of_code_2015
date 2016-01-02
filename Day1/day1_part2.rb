
file = File.open('day1_inputs.txt', 'r')
input = file.read

current = 0

characters = input.chars

characters.each_with_index do |character, index|
  if character == '('
    current += 1
  else
    current -= 1
  end

  if current == -1
  	puts "The char position is #{index+1}."
  	break
  end 
end

puts "The current level is #{current}."

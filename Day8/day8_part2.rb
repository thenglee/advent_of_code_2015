lines = File.readlines('day8_inputs.txt')

string_code, new_string_value, str_size = 0, 0, 0
hasBackSlash, isHexa, hexaCharOne = false, false, false

lines.each do |line|
  string_data = line.chomp
  str_size = string_data.length
  string_code += str_size

  string_data = string_data[1,string_data.length-2]

  string_data.each_char do |c|

    if hasBackSlash == false
      if c == "\\"
        hasBackSlash = true
      end
    else
      if isHexa == false
        if c == 'x' 
          isHexa = true
        elsif c == "\\" || c == "\""
          str_size += 2
          hasBackSlash = false
        end
      else
        if hexaCharOne == false
          hexaCharOne = true
        else
          str_size += 1
          hasBackSlash, isHexa, hexaCharOne = false, false, false
        end
      end
    end
  end
  str_size += 4
  new_string_value += str_size
  str_size = 0
end

puts "New String Code - Original String Code = #{new_string_value} - #{string_code} = #{new_string_value - string_code}"

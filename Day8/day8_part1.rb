lines = File.readlines('day8_inputs.txt')

string_code, string_value = 0, 0
hasBackSlash, isHexa, hexaCharOne = false, false, false

lines.each do |line|
  string_data = line.chomp
  string_code += string_data.length
  string_data = string_data[1,string_data.length-2]

  string_data.each_char do |c|

    if hasBackSlash == false
      if c == "\\"
        hasBackSlash = true
      else
        string_value += 1
      end
    else
      if isHexa == false
        if c == 'x' 
          isHexa = true
        elsif c == "\\" || c == "\""
          string_value += 1
          hasBackSlash = false
        end
      else
        if hexaCharOne == false
          hexaCharOne = true
        else
          string_value += 1
          hasBackSlash, isHexa, hexaCharOne = false, false, false
        end
      end
    end
  end
end

puts "String Code - String Value = #{string_code} - #{string_value} = #{string_code - string_value}"

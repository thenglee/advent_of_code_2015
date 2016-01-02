# For Day 7 Part 2, open 'day7_inputs.txt' file 
# and replace the line
# '1674 -> b' with '46065 -> b'

lines = File.readlines('day7_inputs.txt')

circuit = {}
gate, input1, input2, output= '', '', '', ''
signal1, signal2, output_signal = nil, nil, nil
inputs = []

until circuit.has_key?('a') do
  lines.each do |line|

    signal1, signal2 = nil, nil
    gate = line[/[A-Z]+/]
    output = line[/[a-z]+$/]

    if gate == nil
      input1 = line[/\w+/]

      if input1.match(/\d+/) == nil
        if circuit[input1]
          circuit[output] = circuit[input1]
        end
      else
        circuit[output] = input1.to_i
      end

    elsif gate == 'NOT'
      input1 = line[/[a-z]+/]
      signal1 = circuit[input1]

      if signal1
        bits = 15.downto(0).map { |n| (~signal1)[n] }.join
        output_signal = bits.to_i(2)
        circuit[output] = output_signal.to_i
      end

    else
      inputs = line.match(/(\w+)(\s[A-Z]+\s)(\w+)/)
      input1 = inputs[1]
      input2 = inputs[3]

      signal1 = circuit[input1]
      signal2 = circuit[input2]

      if gate == 'OR' || gate == 'AND'
        unless input1.match(/\d+/) == nil
          signal1 = input1.to_i
        end

        if signal1 && signal2
          signal1.to_s(2)
          signal2.to_s(2)
          output_signal = gate == 'OR' ? (signal1 | signal2).to_s : (signal1 & signal2).to_s
          circuit[output] = output_signal.to_i
        end

      elsif gate == 'LSHIFT' || gate == 'RSHIFT'
        if signal1
          signal2 = input2.to_i
          output_signal = gate == 'LSHIFT' ? (signal1 << signal2).to_s : (signal1 >> signal2).to_s
          circuit[output] = output_signal.to_i
        end
      end
    end
  end
end


puts "wire a has signal: #{circuit['a']}"

# References
# http://www.calleerlandsson.com/2014/02/06/rubys-bitwise-operators/
# http://husseinelmotayam.tumblr.com/post/22841235255/ruby-integer-binary-bidirectional-conversion
# http://www.computerhope.com/jargon/num/16bit.htm

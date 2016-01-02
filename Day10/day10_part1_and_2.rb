current_int, next_int, seqCount  = 0, 0, 0
hasRepeat = false
input = '1321131112'
current_seq = input.chars.map(&:to_i)
new_seq = []

# For Day 10 Part 2, change the below line 
# from '40.times do' to '50.times do'

40.times do 
  current_seq.each_index do |i|
    current_int = current_seq[i]
    next_int = current_seq[i+1]

    if next_int == current_int
      hasRepeat = true
      seqCount += 1
    else
      if hasRepeat
        seqCount += 1
        new_seq << seqCount
        new_seq << current_int
        hasRepeat = false
        seqCount = 0
      else
      	new_seq << 1
        new_seq << current_int
      end
    end
  end
  current_seq = new_seq
  new_seq = []
end

puts "The length of the result is #{current_seq.length}."

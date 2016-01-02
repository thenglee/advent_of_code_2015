require 'digest/md5'

key = 'ckczppom'
number = 0

digest = ""
prestring = ""

while prestring != '00000' do
  digest = Digest::MD5.hexdigest(key+number.to_s)
  prestring = digest[0,5]
  number += 1
end

puts "number is #{number-1}."
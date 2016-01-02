require 'digest/md5'

key = 'ckczppom'
number = 0

digest = ""
prestring = ""

while prestring != '000000' do
  digest = Digest::MD5.hexdigest(key+number.to_s)
  prestring = digest[0,6]
  number += 1
end

puts "number is #{number-1}."
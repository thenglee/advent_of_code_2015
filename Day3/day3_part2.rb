file = File.read('day3_inputs.txt')

santa_turn = true
houses = 0
houses_visited = {"0x0": 1}
coordinates = ""

class Giver 
  attr_accessor :x, :y

  def initialize
   self.x = 0
   self.y = 0
  end

  def move(move_char)
    if move_char == '^'
      self.x += 1
    end

    if move_char == 'v'
      self.x -= 1
    end

    if move_char == '>'
      self.y += 1
    end

    if move_char == '<'
      self.y -= 1
    end
  end
end


santa = Giver.new
robo = Giver.new

moves = file.chars

moves.each do |move|
  if santa_turn
    santa.move(move)
    coordinates = "#{santa.x}x#{santa.y}"
  else
    robo.move(move)
    coordinates = "#{robo.x}x#{robo.y}"
  end

  unless houses_visited.has_key?(coordinates)
    houses_visited[coordinates] = 1
    houses += 1
  end

  santa_turn = !santa_turn
end

puts "Unique houses visited is #{houses}."


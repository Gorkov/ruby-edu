puts 'Enter first side of the triangle'
first_side = gets.chomp.to_f

puts 'Enter second side of the triangle'
second_side = gets.chomp.to_f

puts 'Enter third side of the triangle'
third_side = gets.chomp.to_f

all_sides = [first_side, second_side, third_side].sort!

if all_sides.include?(0.0)
  puts 'Enter correct values please.'
else
  answer = ''

  if all_sides.uniq.size == 1
    answer += 'isosceles and equilateral, but not rectangular'
  else
    types = []
    types << 'rectangular' if (all_sides[0]**2) + (all_sides[1]**2) == (all_sides[2]**2)
    types << 'isosceles' if all_sides[0] == all_sides[1]

    answer += types.join(' and ')
  end

  puts "This triangle is #{answer.empty? ? 'simple' : answer}."
end

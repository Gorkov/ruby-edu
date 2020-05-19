puts 'Enter the length of the base of the triangle'
base_length = gets.chomp.to_f

puts 'Enter the height of the triangle'
height = gets.chomp.to_f

if base_length == 0.0 || height == 0.0
  puts "Enter correct values please."
else
  puts "Triangle area is #{1/2.0*(base_length*height)}"
end

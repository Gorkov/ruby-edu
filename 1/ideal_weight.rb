puts 'What is your name?'
name = gets.chomp

puts 'How tall are you?'
weight = gets.chomp.to_i - 110

puts "Hello #{name}! " + (weight < 0 ? 'You already have optimal weight!' : "The optimal weight for you is #{weight}kg.")
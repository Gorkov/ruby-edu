consonants = %w[ a e i o u ]

result = {}

('a'..'z').to_a.each_with_index do |value, index|
  result[value] = index + 1 if consonants.include? value
end

p result
hash = ('a'..'z').each_with_index.map do |letter, index|
  [letter, index + 1] if %w(a e i o u).include?(letter)
end.compact.to_h
require 'date'

puts 'Enter date'
date = gets.chomp.to_i
unless date
  puts 'Date cannot be blank!'
  exit
end

puts 'Enter month'
month = gets.chomp.to_i
unless month
  puts 'Month cannot be blank!'
  exit
end

puts 'Enter year'
year = gets.chomp.to_i
unless year
  puts 'Year cannot be blank!'
  exit
end

begin
  current_date = Date.new(year, month, date)
rescue
  puts 'Invalid date!'
  exit
end

p current_date.yday

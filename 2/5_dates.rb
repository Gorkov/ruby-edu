require 'date'
puts 'Type date in format DD.MM.YYYY'
begin
  date = Date.parse(gets.chomp)
rescue
  puts 'Incorrect date. Please try again'
  return
end
input_month_number = date.strftime('%m').to_i
input_day_number = date.strftime('%d').to_i
puts 'Sum of days in this year by current date:'
if input_month_number == 1
  puts input_day_number
else
  count_of_prev_months = (1..(input_month_number - 1)).map do |month_number|
    Date.civil(date.year, month_number, -1).day
  end.compact.inject(0, :+)
  puts input_day_number + count_of_prev_months
end
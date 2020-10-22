require 'date'

(1..12).each do |month_number|
  last_month_day = Date.civil(Date.today.year, month_number, -1)
  puts last_month_day.strftime('%b') if last_month_day.strftime('%d').to_i == 30
end
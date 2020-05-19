require 'date'

month_info = {}
(Date.civil(Date.today.year, 1, -1)..Date.civil(Date.today.year, 12, -1)).map do |month|
  month_info[month.strftime('%b')] = month.strftime('%d')
end

month_info.each { |month, last_date| puts month if last_date == '30'}
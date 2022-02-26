require 'date'
months_hash = (1..12).map do |month_index|
  day = Date.civil(Date.today.year, month_index, -1)
  [day.strftime('%b'), day.day]
end.to_h
months_hash.each { |name, size| puts name if size == 30 }
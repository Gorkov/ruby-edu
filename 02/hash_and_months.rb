require 'date'

Date.civil(Date.today.year, 1, -1)..Date.civil(Date.today.year, 12, -1).each do |month|
  # TODO condition of last day
end
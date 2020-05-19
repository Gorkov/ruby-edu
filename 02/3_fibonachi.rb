pre_last = 1
last = 1
current = 0

result_array = []

while current < 100
  current = pre_last + last

  result_array << current if current < 100

  pre_last = last
  last = current
end

p result_array

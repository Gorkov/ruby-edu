max_number = 101
fib_array = [0, 1]
while fib_array.max < max_number do
  next_number = fib_array[-1] + fib_array[-2]
  break if next_number > (max_number - 1)
  fib_array << next_number
end
array = (10..100).to_a
array.delete_if { |number| number % 5 != 0}

p array
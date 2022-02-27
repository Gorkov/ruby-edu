stop_product_calculates = false
puts 'Type product, price and count by comma and say "stop" for end typing'
basket = {}
until stop_product_calculates do
  input = gets.chomp
  if input == 'stop'
    stop_product_calculates = true
    next
  end
  product, price, count = input.split(',').map!(&:strip)
  if basket[product]
    if basket[product][:price] == price.to_f
      basket[product][:count] = basket[product][:count] + count.to_f
      next
    else
      product = "#{product}_new"
    end
  end
  basket[product] = { :price => price.to_f,
                      :count => count.to_f }
end
puts basket

puts "Summary by each product:"
basket.each { |product, attr| puts "#{product} = #{attr[:count] * attr[:price]}$" }

puts "Summary by all basket = #{basket.map { |_, attr| attr[:count] * attr[:price] }.compact.inject(0, :+)}$"



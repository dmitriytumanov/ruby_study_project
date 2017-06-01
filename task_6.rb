hash_products = {}

loop do
  puts "Enter product name:"
    product = gets.chomp
    break if product == "stop"
  puts "Enter product price:"
    price = gets.chomp.to_f
  puts "Enter product quantity:"
    quantity = gets.chomp.to_f
    hash_products[product] = {price => quantity}
end

sum = 0

hash_products.each do |product, price|
  cost = price.keys[0] * price.values[0]
  puts "Product <#{product}> bought at a price <#{cost}>"
  sum += cost
end

puts "Total purchase amount is <#{sum}>"

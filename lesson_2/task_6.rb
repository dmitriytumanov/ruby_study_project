# <Amount of purchases> program.
# This program calculates the cost of the user's shopping cart.

hash_products = {}

loop do
  puts "Enter product name:"
    product = gets.chomp
    break if product == "stop"
  puts "Enter product price:"
    price = gets.chomp.to_f
  puts "Enter product quantity:"
    quantity = gets.chomp.to_f
    hash_products[product] = { price: price, quantity: quantity }
end

sum = 0

hash_products.each do |product, product_cost|
  cost = product_cost[:price] * product_cost[:quantity]
  puts "Product <#{product}> bought at a price <#{cost}>"
  sum += cost
end

puts "Total purchase amount is <#{sum}>"

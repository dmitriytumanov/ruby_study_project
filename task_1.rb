# <Ideal weight> program.
# This program calculates the ideal weight for a person's growth.

puts "What's your name ?"
name = gets.chomp.capitalize!

puts "How tall are you ?"
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight > 0
  puts "#{name}, your ideal weight = #{ideal_weight}."
else
  puts "Your weight is already optimal."
end

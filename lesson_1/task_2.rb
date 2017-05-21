# <Area of a triangle> program.
# This program calculates the area of the triangle by its base and height.

puts "Enter the base of the triangle:"
base = gets.chomp.to_f

puts base

puts "Enter the height of the triangle:"
height = gets.chomp.to_f

area = base * height / 2

puts "The area of the triangle is #{area}."

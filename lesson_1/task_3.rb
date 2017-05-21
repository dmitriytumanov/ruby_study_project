# <Right triangle> program.
# The program determines the type of triangle.

puts "Enter three sides of the triangle:"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

long_side = c
side_2 = a
side_3 = b

if a > b && a > c
  long_side = a
  side_2 = b
  side_3 = c
elsif b > a && b > c
  long_side = b
  side_2 = a
  side_3 = c
end

if long_side ** 2 == side_2 ** 2 + side_3 ** 2
  puts "The triangle is a rectangular."
    if side_2 == side_3
      puts "The triangle is isosceles."
    end
elsif long_side == side_2 && long_side == side_3
  puts "The triangle is equilateral."
end

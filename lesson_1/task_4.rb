# <Quadratic equation> program.
# The program considers the discriminant and roots

puts "Enter the coefficients of equation:"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

discriminant = b ** 2 - 4 * a * c

if discriminant > 0
  sqrt_discriminant = Math.sqrt(discriminant)
  x1 = (-b + sqrt_discriminant) / 2 * a
  x2 = (-b - sqrt_discriminant) / 2 * a
  puts "discriminant = #{discriminant}"
  puts "x1 = #{x1}, x2 = #{x2}"
elsif discriminant == 0
  x = b * (-1) / (2 * a)
  puts "discriminant = #{discriminant}"
  puts "x = #{x}"
else
  puts "discriminant = #{discriminant}"
  puts "The equation has no roots."
end

# <Number by date> program.
# This program determines the serial number by date.

puts "Enter day:"
day = gets.chomp.to_i

puts "Enter number of month:"
month = gets.chomp.to_i

puts "Enter year:"
year = gets.chomp.to_i

days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year.to_f % 4 == 0 && year % 100 != 0) || year % 400 == 0
  days_in_month[1] = 29
end

index = 0
num = 0

while index != month - 1 do
  num += days_in_month[index]
  index += 1
end

num += day

puts "Number = #{num}"

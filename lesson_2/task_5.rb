# <Number by date> program.
# This program determines the serial number by date.

puts "Enter day:"
day = gets.chomp.to_i

puts "Enter month in 'xxx' format:"
month = gets.chomp.to_sym

puts "Enter year:"
year = gets.chomp.to_i

days_in_month = {jan: 31, feb: 28, mar: 31, apr: 30,
                 may: 31, jun: 30, jul: 31, aug: 31,
                 sep: 30, oct: 31, nov: 30, dec: 31}

if (year.to_f % 4 == 0 && year % 100 != 0) || year % 400 == 0
  days_in_month[:feb] = 29
end

num = 0

days_in_month.each do |key, value|
  if key == month
    num += day
    break
  else
    num += value
  end
end

puts "Number = #{num}"

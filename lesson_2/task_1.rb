# <30 days in a month> program.
# This program displays those months, for which the number of days is exactly 30.

days_in_month = {jan: 31, feb: 28, mar: 31, apr: 30,
                 may: 31, jun: 30, jul: 31, aug: 31,
                 sep: 30, oct: 31, nov: 30, dec: 31}

days_in_month.each do |month, days|
  puts month if days == 30
end

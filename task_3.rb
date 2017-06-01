# <Fibonacci numbers> program.
# This program fills the array with Fibonacci numbers up to 100.

fib_arr = []

fib_arr[0] = 0
fib_arr[1] = 1

i = 2

loop do
  fib_arr[i] = fib_arr[i - 1] + fib_arr[i - 2]
  break if fib_arr[i] > 100
  i += 1
end

fib_arr.delete_at(-1)

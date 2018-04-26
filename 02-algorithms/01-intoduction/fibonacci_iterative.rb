def fib(n)
  num1 = 0
  num2 = 1
  temp_num = 1

  n.times do
    temp_num = num1 + num2
    num1 = num2
    num2 = temp_num
  end

  return num1
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
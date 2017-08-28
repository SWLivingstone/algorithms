
 def fib(n)
   return 0 if n == 0
   fib0 = 0
   fib1 = 1
   (n - 1).times do
     temp = fib0
     fib0 = fib1
     fib1 = fib1 + temp
   end
   fib1
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

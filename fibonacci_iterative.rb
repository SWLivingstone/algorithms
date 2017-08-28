
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

 puts fib(5)

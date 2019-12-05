proc add {a b} {
   return [expr $a+$b]
}
set a 1
set b 5
set sum [add $a $b]
puts "sum of $a and $b is $sum"

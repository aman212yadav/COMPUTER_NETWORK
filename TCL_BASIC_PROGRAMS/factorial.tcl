puts -nonewline "Enter number "
flush stdout
gets stdin number
set fact 1
for {set a 1 } {$a <= $number} {incr a} {
   set fact [expr $fact*$a]
}
puts "Factorial of Number $number is $fact"
